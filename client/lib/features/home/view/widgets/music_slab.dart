import 'package:client/core/providers/current_song_notifier.dart';
import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MusicSlab extends ConsumerWidget {
  const MusicSlab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSong = ref.watch(currentSongNotifierProvider);
    if (currentSong == null) {
      return const SizedBox();
    }
    return Container(
      height: 66,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: hexToColor(currentSong.hex_code)),
      padding: const EdgeInsets.all(9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(currentSong.thumbnail_url),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentSong.song_name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    currentSong.artist,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Pallete.subtitleText),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.heart,
                  color: Pallete.whiteColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.play_fill,
                  color: Pallete.whiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
