import React from "react";
import { View, Text, Image, Button, TouchableOpacity } from "react-native";
import { styles } from "./styles";
import QR from "../../assets/img/qrcode.png";
import Verificado from "../../assets/img/verificado.png";

function BodySteamGuard() {
  return (
    <View style={styles.body}>
     
      <Text style={{fontSize:19,textAlign: "center", marginBottom:12, color:"#dadada", }}>Proteja a sua conta Steam e agilize o início de sessão.</Text>

      <Image source={QR} style={{objectFit:"contain", width:180,}}/>

      <Text style={{fontSize:16, textAlign: "center", color:"#dadada",}}>
        {" "}
        Use um código QR para iniciar a sessão em vez de digitar o nome de
        usuário, senha e código.
      </Text>

      <Image source={Verificado} style={{objectFit:"contain", width:260,}}/>

      <Text style={{fontSize:16, textAlign: "center", color:"#dadada",}}>Aprove o início de sessão com um toque.</Text>

      <TouchableOpacity style={styles.button}>
        <Text style={[styles.textButton,{color:"#e9e9e9",}]}>Adicionar autenticador</Text>

      </TouchableOpacity>
    </View>
  );
}

export default BodySteamGuard;
