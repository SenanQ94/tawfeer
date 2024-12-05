import 'package:flutter/material.dart';
import 'package:tawfeer/common/widgets/images/circular_image.dart';
import 'package:tawfeer/utils/constants/image_strings.dart';
import 'package:tawfeer/utils/constants/sizes.dart';

class TChatListTile extends StatelessWidget {
  const TChatListTile({
    super.key,
    required this.onTap,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  final String userName;
  final String lastMessage;
  final String lastMessageTime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.sm, vertical: TSizes.spaceBtwItems / 4),
        child: Row(
          children: [
            TCircularImage(
              image: TImages.user,
              padding: 0,
            ),
            const SizedBox(width: TSizes.md),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                lastMessageTime,
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
