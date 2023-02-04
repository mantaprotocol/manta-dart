// Mocks generated by Mockito 5.3.2 from annotations
// in manta_dart/test/store_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:event_bus/event_bus.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mqtt_client/mqtt_client.dart' as _i2;
import 'package:typed_data/typed_data.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMqttConnectMessage_0 extends _i1.SmartFake
    implements _i2.MqttConnectMessage {
  _FakeMqttConnectMessage_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MqttClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockMqttClient extends _i1.Mock implements _i2.MqttClient {
  @override
  String get server => (super.noSuchMethod(
        Invocation.getter(#server),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set server(String? _server) => super.noSuchMethod(
        Invocation.setter(
          #server,
          _server,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get port => (super.noSuchMethod(
        Invocation.getter(#port),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set port(int? _port) => super.noSuchMethod(
        Invocation.setter(
          #port,
          _port,
        ),
        returnValueForMissingStub: null,
      );
  @override
  String get clientIdentifier => (super.noSuchMethod(
        Invocation.getter(#clientIdentifier),
        returnValue: '',
        returnValueForMissingStub: '',
      ) as String);
  @override
  set clientIdentifier(String? _clientIdentifier) => super.noSuchMethod(
        Invocation.setter(
          #clientIdentifier,
          _clientIdentifier,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get instantiationCorrect => (super.noSuchMethod(
        Invocation.getter(#instantiationCorrect),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set instantiationCorrect(bool? _instantiationCorrect) => super.noSuchMethod(
        Invocation.setter(
          #instantiationCorrect,
          _instantiationCorrect,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get autoReconnect => (super.noSuchMethod(
        Invocation.getter(#autoReconnect),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set autoReconnect(bool? _autoReconnect) => super.noSuchMethod(
        Invocation.setter(
          #autoReconnect,
          _autoReconnect,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get resubscribeOnAutoReconnect => (super.noSuchMethod(
        Invocation.getter(#resubscribeOnAutoReconnect),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  set resubscribeOnAutoReconnect(bool? _resubscribeOnAutoReconnect) =>
      super.noSuchMethod(
        Invocation.setter(
          #resubscribeOnAutoReconnect,
          _resubscribeOnAutoReconnect,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set connectionHandler(_i2.MqttConnectionHandlerBase? _connectionHandler) =>
      super.noSuchMethod(
        Invocation.setter(
          #connectionHandler,
          _connectionHandler,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set websocketProtocolString(List<String>? _websocketProtocolString) =>
      super.noSuchMethod(
        Invocation.setter(
          #websocketProtocolString,
          _websocketProtocolString,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set subscriptionsManager(_i2.SubscriptionsManager? _subscriptionsManager) =>
      super.noSuchMethod(
        Invocation.setter(
          #subscriptionsManager,
          _subscriptionsManager,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set keepAlive(_i2.MqttConnectionKeepAlive? _keepAlive) => super.noSuchMethod(
        Invocation.setter(
          #keepAlive,
          _keepAlive,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get keepAlivePeriod => (super.noSuchMethod(
        Invocation.getter(#keepAlivePeriod),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set keepAlivePeriod(int? _keepAlivePeriod) => super.noSuchMethod(
        Invocation.setter(
          #keepAlivePeriod,
          _keepAlivePeriod,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get disconnectOnNoResponsePeriod => (super.noSuchMethod(
        Invocation.getter(#disconnectOnNoResponsePeriod),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set disconnectOnNoResponsePeriod(int? _disconnectOnNoResponsePeriod) =>
      super.noSuchMethod(
        Invocation.setter(
          #disconnectOnNoResponsePeriod,
          _disconnectOnNoResponsePeriod,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set publishingManager(_i2.PublishingManager? _publishingManager) =>
      super.noSuchMethod(
        Invocation.setter(
          #publishingManager,
          _publishingManager,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set connectionMessage(_i2.MqttConnectMessage? _connectionMessage) =>
      super.noSuchMethod(
        Invocation.setter(
          #connectionMessage,
          _connectionMessage,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onDisconnected(_i2.DisconnectCallback? _onDisconnected) =>
      super.noSuchMethod(
        Invocation.setter(
          #onDisconnected,
          _onDisconnected,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onConnected(_i2.ConnectCallback? _onConnected) => super.noSuchMethod(
        Invocation.setter(
          #onConnected,
          _onConnected,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onAutoReconnect(_i2.AutoReconnectCallback? _onAutoReconnect) =>
      super.noSuchMethod(
        Invocation.setter(
          #onAutoReconnect,
          _onAutoReconnect,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onAutoReconnected(
          _i2.AutoReconnectCompleteCallback? _onAutoReconnected) =>
      super.noSuchMethod(
        Invocation.setter(
          #onAutoReconnected,
          _onAutoReconnected,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set clientEventBus(_i3.EventBus? _clientEventBus) => super.noSuchMethod(
        Invocation.setter(
          #clientEventBus,
          _clientEventBus,
        ),
        returnValueForMissingStub: null,
      );
  @override
  int get connectTimeoutPeriod => (super.noSuchMethod(
        Invocation.getter(#connectTimeoutPeriod),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set connectTimeoutPeriod(int? period) => super.noSuchMethod(
        Invocation.setter(
          #connectTimeoutPeriod,
          period,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set manuallyAcknowledgeQos1(bool? state) => super.noSuchMethod(
        Invocation.setter(
          #manuallyAcknowledgeQos1,
          state,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get manuallyAcknowledgeQos1 => (super.noSuchMethod(
        Invocation.getter(#manuallyAcknowledgeQos1),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  int get messagesAwaitingManualAcknowledge => (super.noSuchMethod(
        Invocation.getter(#messagesAwaitingManualAcknowledge),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  set websocketProtocols(List<String>? protocols) => super.noSuchMethod(
        Invocation.setter(
          #websocketProtocols,
          protocols,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onSubscribed(_i2.SubscribeCallback? cb) => super.noSuchMethod(
        Invocation.setter(
          #onSubscribed,
          cb,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onSubscribeFail(_i2.SubscribeFailCallback? cb) => super.noSuchMethod(
        Invocation.setter(
          #onSubscribeFail,
          cb,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set onUnsubscribed(_i2.UnsubscribeCallback? cb) => super.noSuchMethod(
        Invocation.setter(
          #onUnsubscribed,
          cb,
        ),
        returnValueForMissingStub: null,
      );
  @override
  set pongCallback(_i2.PongCallback? cb) => super.noSuchMethod(
        Invocation.setter(
          #pongCallback,
          cb,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool? acknowledgeQos1Message(_i2.MqttPublishMessage? message) =>
      (super.noSuchMethod(
        Invocation.method(
          #acknowledgeQos1Message,
          [message],
        ),
        returnValueForMissingStub: null,
      ) as bool?);
  @override
  _i4.Future<_i2.MqttClientConnectionStatus?> connect([
    String? username,
    String? password,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #connect,
          [
            username,
            password,
          ],
        ),
        returnValue: _i4.Future<_i2.MqttClientConnectionStatus?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i2.MqttClientConnectionStatus?>.value(),
      ) as _i4.Future<_i2.MqttClientConnectionStatus?>);
  @override
  _i2.MqttConnectMessage getConnectMessage(
    String? username,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConnectMessage,
          [
            username,
            password,
          ],
        ),
        returnValue: _FakeMqttConnectMessage_0(
          this,
          Invocation.method(
            #getConnectMessage,
            [
              username,
              password,
            ],
          ),
        ),
        returnValueForMissingStub: _FakeMqttConnectMessage_0(
          this,
          Invocation.method(
            #getConnectMessage,
            [
              username,
              password,
            ],
          ),
        ),
      ) as _i2.MqttConnectMessage);
  @override
  void doAutoReconnect({bool? force = false}) => super.noSuchMethod(
        Invocation.method(
          #doAutoReconnect,
          [],
          {#force: force},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.Subscription? subscribe(
    String? topic,
    _i2.MqttQos? qosLevel,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #subscribe,
          [
            topic,
            qosLevel,
          ],
        ),
        returnValueForMissingStub: null,
      ) as _i2.Subscription?);
  @override
  void resubscribe() => super.noSuchMethod(
        Invocation.method(
          #resubscribe,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  int publishMessage(
    String? topic,
    _i2.MqttQos? qualityOfService,
    _i5.Uint8Buffer? data, {
    bool? retain = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #publishMessage,
          [
            topic,
            qualityOfService,
            data,
          ],
          {#retain: retain},
        ),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);
  @override
  void unsubscribe(
    String? topic, {
    dynamic expectAcknowledge = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #unsubscribe,
          [topic],
          {#expectAcknowledge: expectAcknowledge},
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.MqttSubscriptionStatus getSubscriptionsStatus(String? topic) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSubscriptionsStatus,
          [topic],
        ),
        returnValue: _i2.MqttSubscriptionStatus.doesNotExist,
        returnValueForMissingStub: _i2.MqttSubscriptionStatus.doesNotExist,
      ) as _i2.MqttSubscriptionStatus);
  @override
  void disconnect() => super.noSuchMethod(
        Invocation.method(
          #disconnect,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void disconnectOnNoPingResponse(_i2.DisconnectOnNoPingResponse? event) =>
      super.noSuchMethod(
        Invocation.method(
          #disconnectOnNoPingResponse,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void disconnectOnNoMessageSent(_i2.DisconnectOnNoMessageSent? event) =>
      super.noSuchMethod(
        Invocation.method(
          #disconnectOnNoMessageSent,
          [event],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void internalDisconnect() => super.noSuchMethod(
        Invocation.method(
          #internalDisconnect,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void checkCredentials(
    String? username,
    String? password,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #checkCredentials,
          [
            username,
            password,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void logging({required bool? on}) => super.noSuchMethod(
        Invocation.method(
          #logging,
          [],
          {#on: on},
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setProtocolV31() => super.noSuchMethod(
        Invocation.method(
          #setProtocolV31,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void setProtocolV311() => super.noSuchMethod(
        Invocation.method(
          #setProtocolV311,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
