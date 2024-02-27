import 'package:flutter/material.dart';
import 'package:movie_catalog/models/cast_member.dart';
import 'package:movie_catalog/utils/helpers.dart';

class CastMemberCard extends StatelessWidget {
  const CastMemberCard({super.key, required this.castMember});

  final CastMember castMember;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 180,
        width: (MediaQuery.of(context).size.width / 3) - 10,
        child: Column(
          children: [
            if (castMember.profilePath?.isNotEmpty ?? false)
              Expanded(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder_poster.jpg',
                  image: getProfilePath(castMember.profilePath!),
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Text(
              castMember.originalName ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              castMember.character ?? '',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
