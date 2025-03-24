import React, { useContext } from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { ActivityIndicator, View } from 'react-native';

import { AuthProvider, AuthContext } from './src/context/AuthContext';

import LoginScreen from './src/screens/LoginScreen';
import RegisterScreen from './src/screens/RegisterScreen';
import KuryeScreen from './src/screens/KuryeScreen';
import SirketDashboard from './src/screens/SirketDashboard';
import AdminPanel from './src/screens/AdminPanel';
import NotAuthorizedScreen from './src/screens/NotAuthorizedScreen';

const Stack = createNativeStackNavigator();

const AppRoutes = () => {
  const { isLoading, isLoggedIn, userRole } = useContext(AuthContext);

  if (isLoading) {
    return (
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <ActivityIndicator size="large" color="blue" />
      </View>
    );
  }

  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      {isLoggedIn ? (
        <>
          {userRole === 'kurye' && (
            <Stack.Screen name="KuryeScreen" component={KuryeScreen} />
          )}
          {userRole === 'şirket_sahibi' && (
            <Stack.Screen name="SirketDashboard" component={SirketDashboard} />
          )}
          {userRole === 'admin' && (
            <Stack.Screen name="AdminPanel" component={AdminPanel} />
          )}
          {!['kurye', 'şirket_sahibi', 'admin'].includes(userRole || '') && (
            <Stack.Screen
              name="NotAuthorizedScreen"
              component={NotAuthorizedScreen}
            />
          )}
        </>
      ) : (
        <>
          <Stack.Screen name="Login" component={LoginScreen} />
          <Stack.Screen name="Register" component={RegisterScreen} />
        </>
      )}
    </Stack.Navigator>
  );
};

const App = () => {
  return (
    <AuthProvider>
      <NavigationContainer>
        <AppRoutes />
      </NavigationContainer>
    </AuthProvider>
  );
};

export default App;
