import { useState, useEffect } from "react";
import React from "react";
import { View, Text, TouchableOpacity, TextInput, Image } from "react-native";
import { styles } from "./styles";
import Hisoka from "../../assets/img/hisoka.jpg";
import Ellipsis from "../../assets/img/ellipsis.png";
import Arrow from "../../assets/img/arrow.png";
import { EvilIcons } from "@expo/vector-icons";

function HeaderHome() {
  return (
    <View style={styles.geral}>
      <View style={styles.headerSuperior}>
        <View style={styles.search}>
          <TextInput
            placeholder="STEAM"
            style={styles.input}
            placeholderTextColor="#969696"
          />
          <EvilIcons name="search" size={32} color="#969696"  />
        </View>
        <TouchableOpacity>
          <Image source={Ellipsis} style={styles.ellipsis} />
        </TouchableOpacity>
        <TouchableOpacity>
          <Image source={Hisoka} style={styles.image} />
        </TouchableOpacity>
      </View>

      <View style={styles.headerInferior}>
        <TouchableOpacity style={styles.menu}>
          <Text style={styles.menu}>MENU </Text>
          <Image source={Arrow} style={styles.arrow} />
        </TouchableOpacity>
        <TouchableOpacity style={styles.menu}>
          <Text style={styles.menu}>LISTA DE DESEJOS</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.menu}>
          <Text style={styles.menu}>CARTEIRA</Text>
          <Text style={[{ color: "#417a9b" }, { fontSize: 11 }]}>
            {" "}
            (R$ 0,00){" "}
          </Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

export default HeaderHome;
