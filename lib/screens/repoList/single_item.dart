import 'package:flutter/material.dart';
import 'package:sovware/db/itemModel.dart';
import 'package:sovware/values/color_utils.dart';
import 'package:sovware/values/image_assets.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({Key? key, required this.hasNetwork,  required this.items, required this.onTap}) : super(key: key);
  final DbItems items;
  final VoidCallback onTap;
  final bool hasNetwork;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0, right: 17.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: ColorUtils.grey_404040))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _firstRow(),
            SizedBox(height: 8),
            _secondRow(),
          ],
        ),
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: [
        _repoNameWidget(items.name.toString()),
        _starCountWidget(items.stargazersCount.toString()),
      ],
    );
  }

  Widget _repoNameWidget(String text) {
    return Expanded(
      flex: 5,
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w400,
          color: ColorUtils.white,
        ),
      ),
    );
  }

  Widget _starCountWidget(String star) {
    return Expanded(
      flex: 1,
      child: Text(
        star,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          color: ColorUtils.grey_B8B8B8,
        ),
      ),
    );
  }

  Widget _secondRow() {
    return Row(
      children: [
        _avaterWidget(items.avatarUrl.toString()),
        const SizedBox(
          width: 8,
        ),
        nameText(items.login.toString()),
      ],
    );
  }

  Widget _avaterWidget(String img) {
    return ClipOval(
      child: SizedBox.fromSize(// Image radius
          child: hasNetwork? Image.network(img, height: 20, width: 20,) : Image.asset(ImageAssets.AVATER, height: 20, width: 20,)
      ),
    );
  }

  Widget nameText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_9B9B9B,
      ),
    );
  }
}
