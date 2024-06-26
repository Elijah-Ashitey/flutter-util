library shared_utils;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:shared_utils/src/spacing.dart';

import '../shared_utils.dart';

/// extensions on any [Widget]
extension WidgetX on Widget {
  Widget fillMaxHeight(BuildContext context, [double ratio = 1.0]) =>
      SizedBox(height: context.height * ratio, child: this);

  Widget fillMaxWidth(BuildContext context, [double ratio = 1.0]) =>
      SizedBox(width: context.width * ratio, child: this);

  Widget fillMaxSize(BuildContext context, [double ratio = 1.0]) => SizedBox(
        height: context.height * ratio,
        width: context.width * ratio,
        child: this,
      );

  Widget horizontal(double spacing) => Padding(
        padding: EdgeInsets.symmetric(horizontal: spacing),
        child: this,
      );

  Widget vertical(double spacing) => Padding(
        padding: EdgeInsets.symmetric(vertical: spacing),
        child: this,
      );

  Widget bottom(double spacing) => Padding(
        padding: EdgeInsets.only(bottom: spacing),
        child: this,
      );

  Widget top(double spacing) => Padding(
        padding: EdgeInsets.only(top: spacing),
        child: this,
      );

  Widget left(double spacing) => Padding(
        padding: EdgeInsets.only(left: spacing),
        child: this,
      );

  Widget right(double spacing) => Padding(
        padding: EdgeInsets.only(right: spacing),
        child: this,
      );

  Widget clickable({
    required Function() onTap,
    BorderRadius? radius,
    Color? color,
  }) =>
      GestureDetector(onTap: onTap, child: this);

  Widget hero({required String tag}) => Hero(tag: tag, child: this);

  Widget withIndicator(BuildContext context,
          {bool show = true, bool left = false}) =>
      DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.theme.colorScheme.primary
                  .withOpacity(kEmphasisMedium),
              style: show && !left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
            left: BorderSide(
              color: context.theme.colorScheme.primary
                  .withOpacity(kEmphasisMedium),
              style: show && left ? BorderStyle.solid : BorderStyle.none,
              width: kSpacingX4,
            ),
          ),
        ),
        child: this,
      );

  Widget circularClip(radius) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: this,
      );

  Widget withBadge(
    BuildContext context, {
    bool showAsIndicator = true,
    int count = 0,
  }) {
    var kTheme = context.theme;

    /// show badge only when count > 0 or showAsIndicator is true
    var showBadge = showAsIndicator || count > 0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        /// widget itself
        Positioned.fill(child: this),

        if (showBadge) ...{
          Positioned(
            child: Container(
              width: count > 0 ? kSpacingX16 : kSpacingX12,
              height: count > 0 ? kSpacingX16 : kSpacingX12,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: kTheme.colorScheme.error,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: showAsIndicator
                  ? null
                  : '${count > 99 ? '99+' : count}'.overline(
                      context,
                      color: kTheme.colorScheme.onError,
                    ),
            ),
          ),
        }
      ],
    );
  }

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget centered() => Center(child: this);

// Widget withFadeAnimation({double delay = 1200}) {
//   final tween = MultiTrackTween([
//     Track('opacity')
//         .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//     Track('translateY').add(
//         Duration(milliseconds: 500), Tween(begin: -130.0, end: 0.0),
//         curve: Curves.easeOut)
//   ]);

//   return ControlledAnimation(
//     delay: Duration(milliseconds: (500 * delay).round()),
//     duration: tween.duration,
//     tween: tween,
//     child: this,
//     builderWithChild: (context, child, animation) => Opacity(
//       opacity: animation['opacity'],
//       child: Transform.translate(
//           offset: Offset(0, animation['translateY']), child: child),
//     ),
//   );
// }
}

/// extensions on any [Icon]
extension IconX on Icon {
  Icon opacity(double emphasis) => Icon(
        icon,
        size: size,
        color:
            color?.withOpacity(emphasis) ?? kBlackColor.withOpacity(emphasis),
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
}

/// extensions on any [Iterable]
extension IterableX<T> on Iterable<T> {
  /// returns a [List] of [Widget]s
  List<Widget> get toWidgets => map((e) => e as Widget).toList();

  /// returns an item at [index] or null if [index] is out of bounds
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

/// extensions on any [String]
extension TextX on String? {
  Widget h1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.displayLarge?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.displayLarge?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget h2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.displayMedium?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.displayMedium?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget h3(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.displaySmall?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.displaySmall?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget h4(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.headlineMedium?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.headlineMedium?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget h5(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.headlineSmall?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.headlineSmall?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget h6(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.titleLarge?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.titleLarge?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget bodyText1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.bodyLarge?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.bodyLarge?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget bodyText2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.bodyMedium?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.bodyMedium?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget subtitle1(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.titleMedium?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.titleMedium?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget subtitle2(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.titleSmall?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.titleSmall?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget caption(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.bodySmall?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.bodySmall?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget overline(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.labelSmall?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.labelSmall?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget button(
    BuildContext context, {
    Color? color,
    FontWeight? weight,
    double? spacing,
    double emphasis = kEmphasisHighest,
    TextAlign alignment = TextAlign.start,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    double? fontSize,
  }) =>
      Text(
        this ?? '',
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
        style: context.textTheme.labelLarge?.copyWith(
            letterSpacing: spacing,
            fontSize: fontSize,
            fontWeight: weight ?? context.textTheme.labelLarge?.fontWeight,
            color: color?.withOpacity(emphasis) ??
                context.colorScheme.onBackground.withOpacity(emphasis)),
      );

  Widget asSvg({
    double? size,
    double? height,
    double? width,
    bool fromAsset = true,
    BoxFit fit = BoxFit.cover,
  }) =>
      fromAsset
          ? SvgPicture.asset(
              this ?? '',
              height: size ?? height,
              width: size ?? width,
              fit: fit,
              placeholderBuilder: (_) => const SizedBox.shrink(),
            )
          : SvgPicture.network(
              this ?? '',
              height: size ?? height,
              width: size ?? width,
              fit: fit,
              placeholderBuilder: (_) => const SizedBox.shrink(),
            );

  Widget asAssetImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      Image.asset(
        this ?? '',
        height: size ?? height,
        width: size ?? width,
        fit: fit,
      );

  Widget asNetworkImage({
    double? size,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
  }) =>
      isNullOrEmpty()
          ? Container(
              decoration: const BoxDecoration(color: kPlaceholderColor),
              height: size ?? height,
              width: size ?? width,
            )
          : CachedNetworkImage(
              imageUrl: this ?? '',
              height: size ?? height,
              width: size ?? width,
              fit: fit,
              placeholder: (_, __) => Container(
                decoration: const BoxDecoration(
                  color: kPlaceholderColor,
                ),
                height: size ?? height,
                width: size ?? width,
              ),
              errorWidget: (_, __, ___) => Container(
                decoration: const BoxDecoration(
                  color: kPlaceholderColor,
                ),
                height: size ?? height,
                width: size ?? width,
              ),
            );

  Widget avatar({
    required double size,
    bool fromAsset = false,
    bool circular = false,
    BoxFit fit = BoxFit.cover,
  }) =>
      fromAsset
          ? asAssetImage(size: size, fit: fit)
              .circularClip(circular ? size : size / 4)
          : asNetworkImage(size: size, fit: fit)
              .circularClip(circular ? size : size / 4);

  String capitalize() {
    return isNullOrEmpty()
        ? ''
        : this!
            .split(' ')
            .map((str) =>
                '${str[0].toUpperCase()}${str.substring(1).toLowerCase()}')
            .join(' ');
  }

  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

/// extensions on [BuildContext]
extension ContextX on BuildContext {
  // get the default locale language code
  String get languageId =>
      Localizations.maybeLocaleOf(this)?.languageCode ?? 'en';

  /// reference => https://medium.com/@pmatatias/responsive-layout-with-buildcontext-dart-extension-3-145e438fb652
  T responsive<T>(
    T defaultVal, {
    T? xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) =>
      width >= Breakpoints.extraLarge
          ? (xl ?? lg ?? md ?? sm ?? xs ?? defaultVal)
          : width >= Breakpoints.large
              ? (lg ?? md ?? sm ?? xs ?? defaultVal)
              : width >= Breakpoints.medium
                  ? (md ?? sm ?? xs ?? defaultVal)
                  : width >= Breakpoints.small
                      ? (sm ?? xs ?? defaultVal)
                      : width >= Breakpoints.extraSmall
                          ? (xs ?? defaultVal)
                          : defaultVal;

  void withDefaultOverlays({
    Color? statusBarColor,
    Color? navigationBarColor,
    Brightness statusBarIconBrightness = Brightness.dark,
    Brightness statusBarBrightness = Brightness.dark,
    Brightness navigationBarIconBrightness = Brightness.dark,
  }) =>
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: statusBarColor ?? colorScheme.background,
          systemNavigationBarColor:
              navigationBarColor ?? colorScheme.background,
          statusBarIconBrightness: statusBarIconBrightness,
          systemNavigationBarDividerColor:
              navigationBarColor ?? colorScheme.background,
          systemNavigationBarIconBrightness: navigationBarIconBrightness,
          statusBarBrightness: statusBarBrightness,
          systemStatusBarContrastEnforced: false,
          systemNavigationBarContrastEnforced: false,
        ),
      );

  // flutter widget navigator state
  NavigatorState get navigator => Navigator.of(this);

  double get height => MediaQuery.sizeOf(this).height;

  double get width => MediaQuery.sizeOf(this).width;

  ThemeData get theme => Theme.of(this);

  EdgeInsets get padding => MediaQuery.paddingOf(this);

  ColorScheme get colorScheme => theme.colorScheme;

  TextTheme get textTheme => theme.textTheme;

  bool get isMobile => width < Breakpoints.small;

  bool get isTablet => width >= Breakpoints.medium && width < Breakpoints.large;

  bool get isDesktop => width >= Breakpoints.large;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Brightness get invertedThemeBrightness =>
      theme.brightness == Brightness.light ? Brightness.dark : Brightness.light;

  Future<void> showCustomDialog({
    required String headerIconAsset,
    required String message,
    List<DialogAction> actions = const <DialogAction>[],
    bool showDismissButton = true,
    String negativeButtonText = 'Okay',
    double iconSize = 56,
  }) async =>
      await showBarModalBottomSheet(
          context: this,
          builder: (context) {
            return Material(
              color: colorScheme.surface,
              child: SafeArea(
                top: false,
                child: AnimatedColumn(
                  animateType: AnimateType.slideUp,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    headerIconAsset
                        .asAssetImage(size: iconSize, fit: BoxFit.fitHeight)
                        .vertical(8),
                    message
                        .subtitle1(
                          context,
                          alignment: TextAlign.center,
                          color: colorScheme.onSurface,
                        )
                        .centered(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize:
                          actions.isEmpty ? MainAxisSize.min : MainAxisSize.max,
                      children: [
                        if (showDismissButton) ...{
                          Expanded(
                            child: AppRoundedButton(
                              text: negativeButtonText,
                              onTap: () => Navigator.pop(this),
                              outlined: true,
                            ).right(actions.isEmpty ? 0 : 12),
                          ),
                        },
                        ...actions.map(
                          (e) => AppRoundedButton(
                                  layoutSize: LayoutSize.wrapContent,
                                  onTap: () {
                                    Navigator.pop(this);
                                    if (e.onTap != null) e.onTap!();
                                  },
                                  text: e.label)
                              .horizontal(8)
                              .centered(),
                        ),
                      ],
                    ).centered().top(16),
                  ],
                ).horizontal(24).vertical(12),
              ),
            );
          });

  /// shows a [SnackBar]
  void showSnackBar(String message,
      [Color? background, Color? foreground, String cancelText = 'Dismiss']) {
    var messenger = ScaffoldMessenger.of(this);
    messenger
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: Theme.of(this).textTheme.bodyMedium?.copyWith(
                  color: foreground ?? Theme.of(this).colorScheme.onPrimary,
                ),
          ),
          backgroundColor: background ?? Theme.of(this).colorScheme.primary,
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: cancelText,
            textColor: foreground ?? Theme.of(this).colorScheme.onPrimary,
            onPressed: () => messenger.hideCurrentSnackBar(),
          ),
        ),
      );
  }
}

/// actions for dialogs
class DialogAction {
  final String label;
  final Function()? onTap;

  const DialogAction({required this.label, this.onTap});
}

/// called in initState
void doAfterDelay(Function() block) =>
    Future.delayed(const Duration()).then((value) => block());

/// UI overlay
@Deprecated('Use BuildContext#withDefaultOverlays instead')
void kUseDefaultOverlays(
  BuildContext context, {
  Color? statusBarColor,
  Color? navigationBarColor,
  Brightness statusBarIconBrightness = Brightness.dark,
  Brightness statusBarBrightness = Brightness.dark,
  Brightness navigationBarIconBrightness = Brightness.dark,
}) =>
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? context.colorScheme.background,
        systemNavigationBarColor:
            navigationBarColor ?? context.colorScheme.background,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarDividerColor:
            navigationBarColor ?? context.colorScheme.background,
        systemNavigationBarIconBrightness: navigationBarIconBrightness,
        statusBarBrightness: statusBarBrightness,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
      ),
    );
