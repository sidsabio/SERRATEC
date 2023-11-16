import { StyleSheet, Platform } from "react-native";

export const styles = StyleSheet.create({
  container: {
    backgroundColor: "#121015",
    paddingTop: 60,
   
   
  },
  title: {
    color: "#fff",
    fontSize: 24,
    fontWeight: "bold",
    
  },
  greetings: {
    color: "#fff",
    fontSize: 12,
  },
  image: {
    width: 40,
    height: 40,
  },
  input: {
    
    backgroundColor: "#1f1e25",
    color: "#fff",
    fontSize: 18,
    padding: Platform.OS === "ios" ? 15 : 10,
    marginTop: 30,
    borderRadius: 8,
  },
  button: {
    backgroundColor: "#a370f7",
    padding: 15,
    borderRadius: 7,
    alignItems: "center",
    marginTop: 20,
  },
  buttonText: {
    color: "#FFF",
    fontSize: 17,
    fontWeight: "bold",
    
  },
  buttonSkill: {
    backgroundColor: "#1f1e25",
    padding: 15,
    borderRadius: 50,
    alignItems: "center",
    marginVertical: 5,
    flexDirection: "row",
  },
  textSkill: {
    marginLeft: 5,
    color: "#FFF",
    fontSize: 22,
    fontWeight: "bold",
  },
  backgroundImage: {
    width: '100%',
    height: '100%',
    resizeMode: 'cover', 
    
  },
  viewBackground:{
    width: '100%',
    height: '100%',
    paddingHorizontal:40,
    marginTop:44,

  }
});
