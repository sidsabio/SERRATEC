import React from "react";
import { View } from "react-native";
import { styles } from "./styles";
import HeaderHome from "../../components/HeaderHome";
import BodyHome from "../../components/BodyHome";

function Home() {
  return (
    <View style={styles.container}>
      <HeaderHome />
      <BodyHome />
    </View>
  );
}

export default Home;
