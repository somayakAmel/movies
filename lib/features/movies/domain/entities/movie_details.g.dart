// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDetailsEntityAdapter extends TypeAdapter<MovieDetailsEntity> {
  @override
  final int typeId = 1;

  @override
  MovieDetailsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDetailsEntity(
      id: fields[0] as int,
      title: fields[1] as String?,
      overview: fields[2] as String?,
      posterPath: fields[3] as String?,
      backdropPath: fields[4] as String?,
      releaseDate: fields[5] as String?,
      voteAverage: fields[6] as double?,
      voteCount: fields[7] as int?,
      runtime: fields[8] as int?,
      isAdult: fields[9] as bool?,
      homepage: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDetailsEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.backdropPath)
      ..writeByte(5)
      ..write(obj.releaseDate)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.voteCount)
      ..writeByte(8)
      ..write(obj.runtime)
      ..writeByte(9)
      ..write(obj.isAdult)
      ..writeByte(10)
      ..write(obj.homepage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDetailsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
