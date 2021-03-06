import 'package:flutter/material.dart';
import 'package:sovware/db/itemModel.dart';
import 'package:sovware/utils/date_formate_util.dart';
import 'package:sovware/values/color_utils.dart';
import 'package:sovware/values/image_assets.dart';

class Details extends StatelessWidget {
  const Details({Key? key, required this.items, required this.hasNetwork}) : super(key: key);
  final DbItems items;
  final bool hasNetwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.grey_333333,
      appBar: AppBar(
        title: Text(items.name.toString()),
        elevation: 3,
        backgroundColor: ColorUtils.grey_404040,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _userPicture(items.avatarUrl.toString()),
            SizedBox(height: 16,),
            _nameText(items.login.toString()),
            SizedBox(height: 16,),
            _descriptionText(items.description.toString()),
            SizedBox(height: 16,),
            _commonText("Stars: "+ items.stargazersCount.toString()),
            SizedBox(height: 16,),
            _commonText("Last Updated: "+ DateUtil.instance.formatDateWithTimeUTC(items.updatedAt.toString())),
            SizedBox(height: 8,),
            _commonText("Last Pushed: "+ DateUtil.instance.formatDateWithTimeUTC(items.pushedAt.toString())),
          ],
        ),
      ),
    );
  }

  Widget _userPicture(String image){
    return ClipOval(
      child: SizedBox.fromSize(// Image radius
          child: hasNetwork? Image.network(image, height: 168, width: 168,) : Image.asset(ImageAssets.AVATER, height: 168, width: 168,)
      ),
    );
  }

  Widget _nameText(String value) {
    return Text(
      value,
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  Widget _descriptionText(String value) {
    return Text( _isNull(value) ? "N/A" : value,
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.grey_C9C9C9,
      ),
    );
  }

  Widget _commonText(String value) {
    return Text(
      _isNull(value) ? "N/A" : value,
      style: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ColorUtils.white,
      ),
    );
  }

  bool _isNull(String? string){
    if(string == null || string == "null"){
      return true;
    }else {
      return false;
    }
  }
}
