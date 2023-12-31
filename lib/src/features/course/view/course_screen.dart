import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_parameters/app_parameters.dart';
import '../../../constants/type_defs/type_defs.dart';
import '../../../router/coordinator.dart';
import '../../../widgets/common/common.dart';
import '../../../widgets/state/error.dart';
import '../../../widgets/state/loading/loading.dart';
import '../../authentication/data/authentication_repository.dart';
import '../../cart/view/add_to_cart/add_to_cart_button.dart';
import '../../cart/view/cart_icon_button/cart_icon_button.dart';
import '../../checkout/view/buy_button.dart';
import '../../deep_link/view/course_share_button.dart';
import '../../enrolled_course/data/enrolled_course_repository.dart';
import '../../rating_count/data/rating_count_repository.dart';
import '../../rating_count/view/review_star_count_section.dart';
import '../../reviews/application/review_service.dart';
import '../../reviews/view/review_screen/reviews_screen_controller.dart';
import '../../reviews/view/review_screen/widgets/review_list_view.dart';
import '../../wishlist/view/add_to_wishlist/add_to_wishlist_button.dart';
import '../data/course_repository.dart';
import '../model/course.dart';
import 'course_information_section.dart';
import 'course_what_you_will_learn_section.dart';

final isCourseEnrolledProvider =
    Provider.autoDispose.family<bool, CourseId>((ref, courseId) {
  ref.keepAlive();
  final enrolledCourseIds = ref.watch(enrolledCourseIdsProvider);
  return enrolledCourseIds.contains(courseId);
});

class CourseScreen extends ConsumerWidget {
  const CourseScreen({
    super.key,
    required this.courseId,
  });

  final CourseId courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseValue = ref.watch(courseProvider(courseId));
    return LScaffold(
      onRefresh: () async {
        // * Force providers fetch new data
        ref.invalidate(courseProvider(courseId));
        ref.invalidate(starCountProvider(courseId));
        ref.invalidate(reviewsProvider(courseId));
        ref.invalidate(reviewsControllerProvider);
        await Future.delayed(const Duration(seconds: 1));
      },
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              CourseShareButton(courseId: courseId),
              const CartIconButton()
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                courseValue.when(
                  loading: () => const LoadingState(),
                  error: (_, __) => const ErrorState(),
                  data: (course) => Padding(
                    padding: UiParameters.screenPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gaps.h12,
                        SizedBox(
                          height: MediaQuery.of(context).size.width /
                              UiParameters.videoAspectRatio,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: UiParameters.thumbnailBorderRadius,
                            child: LNetworkImage(
                              course.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Gaps.h12,
                        CourseInformationSection(
                          name: course.name,
                          description: course.description,
                          instructorName: course.instructorName,
                          courseId: courseId,
                        ),
                        Gaps.h16,
                        PriceLabel(
                          price: course.price,
                          salePrice: course.salePrice,
                          isLargeText: true,
                        ),
                        Gaps.h16,
                        _buildBuySection(course),
                        Gaps.h12,
                        WhatYouWillLearn(
                          contents: course.youWillLearn,
                        ),
                        Gaps.h12,
                        ReviewStarCountSection(
                          courseId: courseId,
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final reviewsAsync =
                                ref.watch(reviewsProvider(courseId));
                            return reviewsAsync.maybeWhen(
                              data: (reviews) =>
                                  FixedReviewListView(reviews: reviews),
                              orElse: SizedBox.shrink,
                            );
                          },
                        ),
                        Gaps.h20,
                        SizedBox.fromSize(
                          size: const Size.fromHeight(50.0),
                          child: OutlinedButton(
                            onPressed: () =>
                                LCoordinator.showSeeMoreReviewsScreen(
                              course.name,
                              courseId,
                            ),
                            child: const Text('See More Reviews'),
                          ),
                        ),
                        Gaps.h20,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuySection(LCourse course) {
    return Consumer(builder: (context, ref, child) {
      final isEnrolled = ref.watch(isCourseEnrolledProvider(courseId));

      return isEnrolled
          ? Text(
              'You have enrolled in this course',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.outline),
            )
          : Column(
              children: [
                BuyButton(
                  courseId: courseId,
                  price: course.salePrice ?? course.price,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final isSignedIn = ref.watch(isSignedInProvider);
                    return Row(
                      children: [
                        Expanded(
                          child: AddToCartButton(
                            courseId: courseId,
                          ),
                        ),
                        Visibility(
                          visible: isSignedIn,
                          child: Gaps.w8,
                        ),
                        Visibility(
                          visible: isSignedIn,
                          child: Expanded(
                            child: AddToWishlistButton(
                              id: courseId,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            );
    });
  }
}
