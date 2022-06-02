import 'package:valopedia/func/base_network.dart';

class AgentDataSource {
  static AgentDataSource instance = AgentDataSource();
  Future<Map<String, dynamic>> loadAgent() {
    return BaseNetwork.get("agents");
  }
}

class WeaponDataSource {
  static WeaponDataSource instance = WeaponDataSource();
  Future<Map<String, dynamic>> loadWeapon() {
    return BaseNetwork.get("weapons");
  }
}

class BundleDataSource {
  static BundleDataSource instance = BundleDataSource();
  Future<Map<String, dynamic>> loadBundle() {
    return BaseNetwork.get("bundles");
  }
}

class MapDataSource {
  static MapDataSource instance = MapDataSource();
  Future<Map<String, dynamic>> loadMap() {
    return BaseNetwork.get("maps");
  }
}