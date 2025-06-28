import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ads/core/responsive/custom_responsive.dart';
import 'package:store_ads/features/main_feature/domain/params/ad_param.dart';
import 'package:store_ads/features/main_feature/domain/usecases/get_ads_with_filter_use_case.dart';
import 'package:store_ads/features/main_feature/presentation/manager/get_ads_with_filter_cubit/get_ads_with_filter_cubit.dart';
import 'package:store_ads/features/main_feature/presentation/views/desktop/desktop_main_view.dart';
import 'package:store_ads/features/main_feature/presentation/views/mobile/mobile_main_view.dart';
import 'package:store_ads/injectable_config.dart';

class MainResponsiveView extends StatelessWidget {
  const MainResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAdsWithFilterCubit>(
          create: (context) => GetAdsWithFilterCubit(
            getIt<GetAdsWithFilterUseCase>(),
          )..initPagination(
              params: AdParam(
                pageNumber: 1,
              ),
            ),
        ),
      ],
      child: const CustomResponsive(
        desktop: DesktopMainView(),
        mobile: MobileMainView(),
        tablet: MobileMainView(),
      ),
    );
  }
}
