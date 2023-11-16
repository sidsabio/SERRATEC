import React from "react";
import { TouchableOpacity, View, Text } from "react-native";
import HeaderGuard from "../../components/HeaderGuard";
import { styles } from "./styles";
import BodySteamGuard from "../../components/BodySteamGuard";

export function SteamGuard() {
  return (
    <View style={styles.container}>
      <HeaderGuard />
      <BodySteamGuard/>
    </View>
  );
}
