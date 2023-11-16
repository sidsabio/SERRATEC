import React from "react";
import { View, Text, Image, FlatList } from "react-native";
import { styles } from "./styles";
import { ScrollView } from "react-native-virtualized-view";
import DarkSouls from "../../assets/img/darksouls.jpg";
import Teste from "../../assets/img/teste.png";

function BodyHome() {
  const jogosDestaque = [
    {
      key: "1",
      title: "Dark Souls: Remastered",
      price: "R$ 154,90",
      image: DarkSouls,
    },
    {
      key: "2",
      title: "Red Dead Redemption 2",
      price: "R$ 299,90",
      image: require("../../assets/img/reddead.jpg"),
    },
    {
      key: "3",
      title: "Blasphemous",
      price: "R$ 33,47",
      image: require("../../assets/img/blasphemous.jpg"),
    },
    {
      key: "4",
      title: "Terraria",
      price: "R$ 32,99",
      image: require("../../assets/img/terraria.jpg"),
    },
    {
      key: "5",
      title: "Resident Evil 4",
      price: "R$ 249,00",
      image: require("../../assets/img/residentevil4.jpg"),
    },
    {
      key: "6",
      title: "Elden Ring",
      price: "R$ 229,90",
      image: require("../../assets/img/eldenring.jpg"),
    },
  ];
  return (
    <ScrollView style={styles.body}>
      <Image
        source={Teste}
        style={{ objectFit: "contain", width: 390, height: 260 }}
      />
      <View style={styles.destaques}>
        <Text style={styles.slickSlider}>DESTAQUES E RECOMENDADOS</Text>

        <FlatList
          data={jogosDestaque}
          horizontal={true}
          showsHorizontalScrollIndicator={false}
          renderItem={({ item }) => {
            return (
              <View key={item.key} style={styles.card}>
                <Image source={item.image} style={styles.image} />
                <Text style={styles.title}>{item.title}</Text>
                <Text style={styles.price}>{item.price}</Text>
              </View>
            );
          }}
        />
      </View>
    </ScrollView>
  );
}

export default BodyHome;
