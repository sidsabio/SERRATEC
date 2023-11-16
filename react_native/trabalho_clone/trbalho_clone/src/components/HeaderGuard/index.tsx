import { useState, useEffect } from "react";
import React from "react";
import { View, Text, TouchableOpacity, Image } from "react-native";
import { styles } from "./styles";
import Hisoka from "../../assets/img/hisoka.jpg";
import { MaterialIcons } from '@expo/vector-icons';

function HeaderGuard() {
  return (
    <View style={styles.geral}>
      <View style={styles.headerSuperior}>
      <MaterialIcons name="arrow-back-ios" size={24} color="black" />
        <Text style={styles.title}>STEAM GUARD</Text>
        <TouchableOpacity>
          <Image source={Hisoka} style={styles.image} />
        </TouchableOpacity>
      </View>
    </View>
  );
}

export default HeaderGuard;
