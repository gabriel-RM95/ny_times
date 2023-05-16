import 'package:ny_times/core/utils/enums.dart';

class Utils {
  static String fromMostOption(MostOption option) {
    switch (option) {
      case MostOption.emailed:
        return 'emailed';
      case MostOption.shared:
        return 'shared';
      case MostOption.viewed:
        return 'viewed';
    }
  }

  static int fromPeriod(Period period) {
    switch (period) {
      case Period.one:
        return 1;
      case Period.seven:
        return 7;
      case Period.thirty:
        return 30;
    }
  }
}
