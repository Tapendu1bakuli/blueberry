import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class ImageUtils{
  //Nuritopia
  static const String splashNuritopiaLogo ="assets/icons/splashNuritopiaLogo.png";
  static const String loginTop ="assets/icons/login_top.jpeg";
  //Icons
  static const String appIcon ="assets/icons/de-assignment.png";
  static const String videoImage ="assets/icons/video_image.png";
  static const String bottonBackground ="assets/icons/botton_background.png";
  static const String male1 ="assets/icons/Male-1.jpg";
  static const String male2 ="assets/icons/Male-2.jpg";
  static const String female1 ="assets/icons/female1.jpg";
  static const String female2 ="assets/icons/female4.jpg";
  static const String toLeft ="assets/icons/toLeft.png";
  static const String toRight ="assets/icons/toRight.png";
  static const String instruction1 ="assets/icons/instruction1.png";
  static const String instruction2 ="assets/icons/instruction2.png";
  static const String instruction3 ="assets/icons/instruction3.png";
  static const String instruction4 ="assets/icons/instruction4.png";
  static const String instruction5 ="assets/icons/instruction5.png";
  static const String googleIcon ="assets/icons/plus.png";
  static const String appleIcon ="assets/icons/apple.png";
  static const eventView = "assets/icons/home/eventsView.jpg";
  static const bubble = "assets/icons/home/bubble.png";
  static const takeChallenge = "assets/icons/home/takeachallenge.png";
  static const castVote = "assets/icons/home/castyourvote.png";
  static const checkWinners = "assets/icons/home/checkwinners.png";
  static const carousalImage = "assets/icons/home/Section_Header.png";
  //drawer
  static const drawer = "assets/icons/drawer";
  static const lock = "$drawer/lock.png";
  static const logout = "$drawer/logout.png";
  static const payment = "$drawer/payment.png";
  static const resume = "$drawer/resume.png";
  static const share = "$drawer/share.png";
  static const wallet = "$drawer/wallet.png";
  static const myTicket = "$drawer/ticket.png";
  static const calender = "$drawer/calender.png";
  static const deleteAccount = "$drawer/delete_account.png";
  static const walletBalanceTopCard = "$drawer/wallet_balance_top_card.png";
  static const walletBalanceBottomCard = "$drawer/wallet_balance_bottom_card.png";
  //Carousal
  static const carousalImages = "assets/icons/carousal/home_slider.png";
  //home
  static const takeChallangeImage = "assets/icons/home/challange.png";
  static const sendTokenImage = "assets/icons/home/send_token_background_image.png";
  static const searchIcon = "assets/icons/search-interface-symbol_1.png";
  static const danceIcon = "assets/icons/dance.png";
  static const video = "assets/icons/Video.png";
  static const vote = "assets/icons/vote.png";
  static const profile_icon = "assets/icons/profile_icon.png";
  static const qr= "assets/icons/qr.png";
  static const danceIcon1 = "assets/icons/dance1.png";
  static const follow = "assets/icons/followIcon.jpg";
  static const connect = "assets/icons/connect.png";
  static const deleteIcon = "assets/icons/deleteIcon.png";
  static const walletTopUpImage = "assets/icons/wallet_card_background.png";
  static const playVideo = "assets/icons/play_video.png";
  static const danceIcon2 = "assets/icons/dance2.png";
  static const danceIcon3 = "assets/icons/dance3.png";
  static const paypal = "assets/icons/paypal_1.png";
  static const cripto = "assets/icons/crypto.png";
  static const mail = "assets/icons/mail.png";
  static const containerRoundedBack = "assets/icons/containerRoundedBack.png";
  static const profilePicture = "assets/icons/music.png";
  static const error = "assets/icons/error.png";
  static const filter = "assets/icons/filter.png";
  static const event1 = "assets/icons/event1.png";
  static const event2 = "assets/icons/event2.png";
  static const demoFlag = "assets/icons/flag1.png";
  static const success = "assets/icons/success.png";
  static const whiteHeartImage = "assets/icons/drawer/whiteHeart.png";
  static const checkWinnersImage = "assets/icons/home/winners_list.png";
  static const voteImageImage = "assets/icons/home/vote_Image.png";
  static const homeBottomImage = "assets/icons/home/home_bottom_Image.png";
  static const validateTransaction = "assets/icons/home/validateTransaction.png";
  static const passwordIcon = "assets/icons/home/password.png";
  static const passwordVisible = "assets/icons/home/passwordVisible.png";
  static const demoImage = "assets/icons/home/image13.png";
  static const String loadingImage ="assets/icons/loader_image.gif";
  static const String profileImage ="assets/icons/prifile_image.png";
  static const String noNet ="assets/icons/nonet.jpg";
  static const computerIcon = "assets/icons/home/computerIcon.png";
  static const headphones = "assets/icons/home/headphones.png";
  static const voteIcon = "assets/icons/home/vote.png";




}
Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
}