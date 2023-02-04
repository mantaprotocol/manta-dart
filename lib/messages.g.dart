// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantOrderRequestMessage _$MerchantOrderRequestMessageFromJson(
        Map<String, dynamic> json) =>
    MerchantOrderRequestMessage(
      amount: str_to_decimal_required(json['amount'] as String),
      session_id: json['session_id'] as String,
      fiat_currency: json['fiat_currency'] as String,
      crypto_currency: json['crypto_currency'] as String?,
      version: json['version'] as String? ?? MANTA_VERSION,
    );

Map<String, dynamic> _$MerchantOrderRequestMessageToJson(
        MerchantOrderRequestMessage instance) =>
    <String, dynamic>{
      'amount': decimal_to_str(instance.amount),
      'session_id': instance.session_id,
      'fiat_currency': instance.fiat_currency,
      'crypto_currency': instance.crypto_currency,
      'version': instance.version,
    };

AckMessage _$AckMessageFromJson(Map<String, dynamic> json) => AckMessage(
      txid: json['txid'] as String,
      status: json['status'] as String,
      url: json['url'] as String?,
      amount: str_to_decimal(json['amount'] as String?),
      transaction_hash: json['transaction_hash'] as String?,
      transaction_currency: json['transaction_currency'] as String?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$AckMessageToJson(AckMessage instance) =>
    <String, dynamic>{
      'txid': instance.txid,
      'status': instance.status,
      'url': instance.url,
      'amount': decimal_to_str(instance.amount),
      'transaction_hash': instance.transaction_hash,
      'transaction_currency': instance.transaction_currency,
      'memo': instance.memo,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      amount: str_to_decimal_required(json['amount'] as String),
      destination_address: json['destination_address'] as String,
      crypto_currency: json['crypto_currency'] as String,
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'amount': decimal_to_str(instance.amount),
      'destination_address': instance.destination_address,
      'crypto_currency': instance.crypto_currency,
    };

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };

PaymentRequestMessage _$PaymentRequestMessageFromJson(
        Map<String, dynamic> json) =>
    PaymentRequestMessage(
      merchant: Merchant.fromJson(json['merchant'] as Map<String, dynamic>),
      amount: str_to_decimal_required(json['amount'] as String),
      fiat_currency: json['fiat_currency'] as String,
      destinations: (json['destinations'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      supported_cryptos: (json['supported_cryptos'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$PaymentRequestMessageToJson(
        PaymentRequestMessage instance) =>
    <String, dynamic>{
      'merchant': instance.merchant,
      'amount': decimal_to_str(instance.amount),
      'fiat_currency': instance.fiat_currency,
      'destinations': instance.destinations,
      'supported_cryptos': instance.supported_cryptos.toList(),
    };

PaymentRequestEnvelope _$PaymentRequestEnvelopeFromJson(
        Map<String, dynamic> json) =>
    PaymentRequestEnvelope(
      message: json['message'] as String,
      signature: json['signature'] as String,
      version: json['version'] as String? ?? MANTA_VERSION,
    );

Map<String, dynamic> _$PaymentRequestEnvelopeToJson(
        PaymentRequestEnvelope instance) =>
    <String, dynamic>{
      'message': instance.message,
      'signature': instance.signature,
      'version': instance.version,
    };

PaymentMessage _$PaymentMessageFromJson(Map<String, dynamic> json) =>
    PaymentMessage(
      crypto_currency: json['crypto_currency'] as String,
      transaction_hash: json['transaction_hash'] as String,
      version: json['version'] as String? ?? MANTA_VERSION,
    );

Map<String, dynamic> _$PaymentMessageToJson(PaymentMessage instance) =>
    <String, dynamic>{
      'crypto_currency': instance.crypto_currency,
      'transaction_hash': instance.transaction_hash,
      'version': instance.version,
    };
