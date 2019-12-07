/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  StyleSheet,
  View,
  Text,
  UIManager,
  TouchableOpacity,
  requireNativeComponent,
} from 'react-native';

const CounterView = requireNativeComponent("CounterView");

class App extends React.Component { 
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };
  }

  increment = () => {
    this.setState({ count: this.state.count + 1 })
  }
  update = e => {
    this.setState({
      count: e.nativeEvent.count
    })
  }

  _onUpdate = event => {
    if (this.props.onUpdate) {
      this.props.onUpdate(event.nativeEvent);
    }
  };
  
  updateNative = () => {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this.counterRef),                     // 1
      UIManager["CounterView"].Commands.updateFromManager, // 2
      [this.state.count]                                   // 3
    );
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity
          style={[styles.wrapper, styles.border]}
          onPress={this.increment}
        >
          <Text style={styles.button}>
            {this.state.count}
          </Text>
        </TouchableOpacity>

        <CounterView
          style={ styles.wrapper }
          count={this.state.count}
          onUpdate={this._onUpdate}
          ref={ref => this.ref = ref}
        />
      </View>
    );
  }

}
const styles = StyleSheet.create({
  container: {
    flex: 1, alignItems: "stretch"
  },
  wrapper: {
    flex: 1, alignItems: "center", justifyContent: "center"
  },
  border: {
    borderColor: "#eee", borderBottomWidth: 1
  },
  button: {
    fontSize: 50, color: "orange"
  }
});

export default App;
