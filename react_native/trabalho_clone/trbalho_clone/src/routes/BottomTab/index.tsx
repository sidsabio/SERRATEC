import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Home from "../../screens/Home";
import { FontAwesome5 } from "@expo/vector-icons";
import { SteamGuard } from "../../screens/SteamGuard";
import { MaterialIcons } from '@expo/vector-icons';
import { Octicons } from '@expo/vector-icons';
import { FontAwesome } from '@expo/vector-icons';
import { MaterialCommunityIcons } from '@expo/vector-icons';

const Tab = createBottomTabNavigator();

export function BottomTab() {
  return (
    <Tab.Navigator
      screenOptions={{
        tabBarShowLabel: false,
        tabBarActiveTintColor: "#1d9efa",
        tabBarInactiveTintColor: "#e9e9e9",
        
      }}
    >
      <Tab.Screen
        name="Home"
        component={Home}
        options={{
          headerShown: false,
          tabBarIcon: ({ color, size}) => (
            <FontAwesome5 name="tag" size={22} color={color} />
          ),
        }}
      />
      <Tab.Screen
        name="Enfeite1"
        component={Home}
        options={{
          headerShown: false,
          tabBarIcon: ({ color, size}) => (
            <MaterialCommunityIcons name="newspaper-variant-outline" size={24} color={color} />
          ),
        }}
      />
      <Tab.Screen
        name="SteamGuard"
        component={SteamGuard}
        options={{
          headerShown: false,
          tabBarIcon: ({ color, size}) => (
            <MaterialIcons name="shield" size={22} color={color} />
          ),
        }}
      />
      <Tab.Screen
        name="Enfeite2"
        component={Home}
        options={{
          headerShown: false,
          tabBarIcon: ({ color, size}) => (
            <Octicons name="bell-fill" size={21} color={color} />
          ),
        }}
      />
      <Tab.Screen
        name="Enfeite3"
        component={Home}
        options={{
          headerShown: false,
          tabBarIcon: ({ color, size}) => (
            <FontAwesome name="navicon" size={22} color={color} />
          ),
        }}
      />
          
    </Tab.Navigator>
    
  );
}
