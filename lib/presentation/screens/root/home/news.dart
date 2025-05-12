import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/view_models/news_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 250,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is NewsSongsLoaded) {
              return _buildSongList(state.songs);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildSongList(List<SongEntity> songs) {
    return ListView.separated(
      itemCount: songs.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16),
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemBuilder: (context, index) => _buildItem(songs[index], context),
    );
  }

  Widget _buildItem(SongEntity song, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(song.cover),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 30,
                height: 30,
                transform: Matrix4.translationValues(-10, 15, 0),
                decoration: BoxDecoration(
                  color: context.isDarkMode ? AppColors.darkGrey : Color(0xffe6e6e6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode ? Color(0xff959595) : Color(0xff555555),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          song.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SizedBox(height: 4),
        Text(
          song.artist,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
      ],
    );
  }
}
