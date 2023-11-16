import { StyleSheet, Platform } from "react-native";

export const styles = StyleSheet.create({
  geral: {
    width: 400,
    height: 86,
    margin: 0,
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 0 },
    shadowOpacity: 0.75,
    shadowRadius: 7,
    elevation: 7,
    flexDirection: "column",
    
  },
  headerSuperior: {
    padding: 8,
    flexDirection: "row",
    justifyContent: "space-evenly",
    alignItems: "center",
    paddingHorizontal:8,
  },
  search:{
    flexDirection:"row", 
    alignItems:"center", 
    backgroundColor:"#1f1e25",
    width: 276,
  },
  input: {
    backgroundColor: "#1f1e25",
    color: "#FFFFFF",
    fontSize: 12,
    fontWeight: "bold",
    padding: Platform.OS === "ios" ? 15 : 10,
    borderRadius: 2,
    width: 240,
    height: 44,
  },
  image: {
    width: 40,
    height: 40,
  },
  ellipsis: {
    width: 6,
    height: 20,
  },
  headerInferior: {
    flexDirection: "row",
    alignItems:"center",
    justifyContent: "space-evenly",
  },
  menu: {
    color: "#969696",
    flexDirection: "row",
    alignItems:"center",
    fontSize:12,
    margin:0,
    fontWeight: "bold",
    
  },
  arrow:{
    width:10,
    height:10,
    marginHorizontal:4,
  }
});
