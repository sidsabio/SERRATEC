import { StyleSheet, Platform } from "react-native";

export const styles = StyleSheet.create({
  body: {
    width: 400,
    height: 640,
    margin: 0,
    backgroundColor:"#30445c",
  },
  destaques: {
    marginHorizontal:6,
    
  },
  slickSlider: {
    color: "aliceblue",
    marginTop: 20,
    padding:5,
    
  },
  card: {
    width: 330,
    marginHorizontal: 4,
    height:260,
    borderRadius: 2,
    overflow: 'hidden',
    backgroundColor: '#202c3c',
    elevation: 10,
},
  
  image: {
    width: '100%',
    height: 164,
    resizeMode: "cover",
  },
  title: {
    fontSize: 18,
    fontWeight: 'bold',
    padding: 8,
    color:"aliceblue",
  },
  price: {
    fontSize: 12,
    color: 'aliceblue',
    padding: 8,
  },
 
});
