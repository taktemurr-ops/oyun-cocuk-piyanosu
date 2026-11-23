import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_cocuk_piyanosu/oyun_cocuk_piyanosu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(cocukPiyanosuConfig.title.length, 33);
    expect(cocukPiyanosuConfig.tagline.length, 33);
    for (final s in cocukPiyanosuConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(cocukPiyanosuConfig.gameId, cocukPiyanosuId);
    expect(cocukPiyanosuRules.gameId, cocukPiyanosuId);
    expect(cocukPiyanosuConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(cocukPiyanosuRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: cocukPiyanosuId, optionalMechanics: cocukPiyanosuRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(cocukPiyanosuRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
