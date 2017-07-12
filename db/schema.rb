# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170705052757) do

  create_table "100M_SEGMENT", primary_key: ["SEGMENT_ID", "SEMANTIC_LINK_ID"], force: :cascade do |t|
    t.integer "SEGMENT_ID", null: false
    t.integer "SEMANTIC_LINK_ID", null: false
    t.varchar "START_LINK_ID", limit: 14, null: false
    t.integer "START_NUM", null: false
    t.float "START_POINT_OFFSET", null: false
  end

  create_table "ALTITUDE_10M_MESH", primary_key: ["LOWER_LATITUDE", "LOWER_LONGITUDE", "UPPER_LATITUDE", "UPPER_LONGITUDE"], force: :cascade do |t|
    t.float "LOWER_LATITUDE", null: false
    t.float "LOWER_LONGITUDE", null: false
    t.float "UPPER_LATITUDE", null: false
    t.float "UPPER_LONGITUDE", null: false
    t.real "ALTITUDE", null: false
  end

  create_table "ALTITUDE_10M_MESH_REGISTERED_FIXED", primary_key: "MESH_ID", id: :integer, default: nil, force: :cascade do |t|
    t.float "LOWER_LATITUDE", null: false
    t.float "LOWER_LONGITUDE", null: false
    t.float "UPPER_LATITUDE", null: false
    t.float "UPPER_LONGITUDE", null: false
    t.real "ALTITUDE", null: false
  end

  create_table "ANDROID_ACC_RAW", primary_key: ["DRIVER_ID", "SENSOR_ID", "DATETIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "DATETIME", null: false
    t.real "ACC_X", null: false
    t.real "ACC_Y", null: false
    t.real "ACC_Z", null: false
  end

  create_table "ANDROID_GPS_RAW", primary_key: ["DRIVER_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.float "ALTITUDE", null: false
    t.datetime "ANDROID_TIME"
  end

  create_table "CARS", primary_key: "CAR_ID", id: :integer, default: nil, force: :cascade do |t|
    t.varchar "MODEL", limit: 20, null: false
    t.real "BATTERY"
    t.real "WEIGHT", null: false
    t.real "TIRE_RADIUS", null: false
    t.real "REDUCTION_RATIO", null: false
    t.real "CD_VALUE", null: false
    t.real "FRONTAL_PROJECTED_AREA", null: false
  end

  create_table "CONSUMED_ELECTRIC_ENERGY_100M_SEGMENT", primary_key: ["SEGMENT_ID", "SEMANTIC_LINK_ID", "TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "SEGMENT_ID", null: false
    t.integer "SEMANTIC_LINK_ID", null: false
    t.integer "TRIP_ID", null: false
    t.datetime "JST", null: false
    t.float "CONSUMED_ELECTRIC_ENERGY", null: false
  end

  create_table "CORRECTED_ACC", primary_key: ["DRIVER_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.real "LONGITUDINAL_ACC", null: false
    t.real "LATERAL_ACC", null: false
    t.real "VERTICAL_ACC", null: false
    t.real "ROLL"
    t.real "PITCH"
    t.real "YAW"
    t.real "ALPHA"
    t.real "VECTOR_X"
    t.real "VECTOR_Y"
    t.real "BETA"
    t.real "GAMMA"
  end

  create_table "CORRECTED_GPS", primary_key: ["DRIVER_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
  end

  create_table "CORRECTED_GPS_LPF_EX", primary_key: ["DRIVER_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
  end

  create_table "CORRECTED_GPS_MM", primary_key: ["DRIVER_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.index ["SENSOR_ID", "JST"], name: "DetemineCutOff3"
    t.index ["SENSOR_ID"], name: "DetermineCutOff"
  end

  create_table "CORRECTED_GPS_SPEEDLPF0.05_MM", id: false, force: :cascade do |t|
  end

  create_table "CORRECTED_PICTURE", primary_key: ["DRIVER_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.binary "PICTURE", null: false
  end

  create_table "DRIVERS", primary_key: "DRIVER_ID", id: :integer, default: nil, force: :cascade do |t|
    t.varchar "NAME", limit: 10, null: false
  end

  create_table "Demo_Acc", primary_key: "JST", id: :datetime, default: nil, force: :cascade do |t|
    t.float "ACC_X"
    t.float "ACC_Y"
    t.float "ACC_Z"
  end

  create_table "ECOLOG", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "ENERGY_BY_AIR_RESISTANCE", null: false
    t.real "ENERGY_BY_ROLLING_RESISTANCE", null: false
    t.real "ENERGY_BY_CLIMBING_RESISTANCE", null: false
    t.real "ENERGY_BY_ACC_RESISTANCE"
    t.real "CONVERT_LOSS", null: false
    t.real "REGENE_LOSS", null: false
    t.real "REGENE_ENERGY", null: false
    t.real "LOST_ENERGY", null: false
    t.real "EFFICIENCY", null: false
    t.real "CONSUMED_ELECTRIC_ENERGY", null: false
    t.real "LOST_ENERGY_BY_WELL_TO_WHEEL"
    t.real "CONSUMED_FUEL"
    t.real "CONSUMED_FUEL_BY_WELL_TO_WHEEL"
    t.real "ENERGY_BY_EQUIPMENT"
    t.real "ENERGY_BY_COOLING"
    t.real "ENERGY_BY_HEATING"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
    t.index ["LINK_ID"], name: "indexa"
  end

  create_table "ECOLOG_LINKS_LOOKUP", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "ENERGY_BY_AIR_RESISTANCE", null: false
    t.real "ENERGY_BY_ROLLING_RESISTANCE", null: false
    t.real "ENERGY_BY_CLIMBING_RESISTANCE", null: false
    t.real "ENERGY_BY_ACC_RESISTANCE"
    t.real "CONVERT_LOSS", null: false
    t.real "REGENE_LOSS", null: false
    t.real "REGENE_ENERGY", null: false
    t.real "LOST_ENERGY", null: false
    t.real "EFFICIENCY", null: false
    t.real "CONSUMED_ELECTRIC_ENERGY", null: false
    t.real "LOST_ENERGY_BY_WELL_TO_WHEEL"
    t.real "CONSUMED_FUEL"
    t.real "CONSUMED_FUEL_BY_WELL_TO_WHEEL"
    t.real "ENERGY_BY_EQUIPMENT"
    t.real "ENERGY_BY_COOLING"
    t.real "ENERGY_BY_HEATING"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
    t.index ["DRIVER_ID", "CAR_ID", "SENSOR_ID", "JST"], name: "ForAccuracyTrip"
    t.index ["LINK_ID"], name: "<Name of Missing Index, sysname,>"
  end

  create_table "ECOLOG_LINKS_LOOKUP2", primary_key: ["TRIP_ID", "SENSOR_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "ENERGY_BY_AIR_RESISTANCE", null: false
    t.real "ENERGY_BY_ROLLING_RESISTANCE", null: false
    t.real "ENERGY_BY_CLIMBING_RESISTANCE", null: false
    t.real "ENERGY_BY_ACC_RESISTANCE"
    t.real "CONVERT_LOSS", null: false
    t.real "REGENE_LOSS", null: false
    t.real "REGENE_ENERGY", null: false
    t.real "LOST_ENERGY", null: false
    t.real "EFFICIENCY", null: false
    t.real "CONSUMED_ELECTRIC_ENERGY", null: false
    t.real "LOST_ENERGY_BY_WELL_TO_WHEEL"
    t.real "CONSUMED_FUEL"
    t.real "CONSUMED_FUEL_BY_WELL_TO_WHEEL"
    t.real "ENERGY_BY_EQUIPMENT"
    t.real "ENERGY_BY_COOLING"
    t.real "ENERGY_BY_HEATING"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
  end

  create_table "ECOLOG_LPF_EX_LINKS_LOOKUP", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "ENERGY_BY_AIR_RESISTANCE", null: false
    t.real "ENERGY_BY_ROLLING_RESISTANCE", null: false
    t.real "ENERGY_BY_CLIMBING_RESISTANCE", null: false
    t.real "ENERGY_BY_ACC_RESISTANCE"
    t.real "CONVERT_LOSS", null: false
    t.real "REGENE_LOSS", null: false
    t.real "REGENE_ENERGY", null: false
    t.real "LOST_ENERGY", null: false
    t.real "EFFICIENCY", null: false
    t.real "CONSUMED_ELECTRIC_ENERGY", null: false
    t.real "LOST_ENERGY_BY_WELL_TO_WHEEL"
    t.real "CONSUMED_FUEL"
    t.real "CONSUMED_FUEL_BY_WELL_TO_WHEEL"
    t.real "ENERGY_BY_EQUIPMENT"
    t.real "ENERGY_BY_COOLING"
    t.real "ENERGY_BY_HEATING"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
  end

  create_table "ECOLOG_MIDDLE", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
  end

  create_table "ECOLOG_MM_LINKS_LOOKUP", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "ENERGY_BY_AIR_RESISTANCE", null: false
    t.real "ENERGY_BY_ROLLING_RESISTANCE", null: false
    t.real "ENERGY_BY_CLIMBING_RESISTANCE", null: false
    t.real "ENERGY_BY_ACC_RESISTANCE"
    t.real "CONVERT_LOSS", null: false
    t.real "REGENE_LOSS", null: false
    t.real "REGENE_ENERGY", null: false
    t.real "LOST_ENERGY", null: false
    t.real "EFFICIENCY", null: false
    t.real "CONSUMED_ELECTRIC_ENERGY", null: false
    t.real "LOST_ENERGY_BY_WELL_TO_WHEEL"
    t.real "CONSUMED_FUEL"
    t.real "CONSUMED_FUEL_BY_WELL_TO_WHEEL"
    t.real "ENERGY_BY_EQUIPMENT"
    t.real "ENERGY_BY_COOLING"
    t.real "ENERGY_BY_HEATING"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
  end

  create_table "ECOLOG_MM_LINKS_LOOKUP2", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "JST", null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.real "SPEED", null: false
    t.real "HEADING", null: false
    t.real "DISTANCE_DIFFERENCE", null: false
    t.real "TERRAIN_ALTITUDE", null: false
    t.real "TERRAIN_ALTITUDE_DIFFERENCE", null: false
    t.real "LONGITUDINAL_ACC"
    t.real "LATERAL_ACC"
    t.real "VERTICAL_ACC"
    t.real "ENERGY_BY_AIR_RESISTANCE", null: false
    t.real "ENERGY_BY_ROLLING_RESISTANCE", null: false
    t.real "ENERGY_BY_CLIMBING_RESISTANCE", null: false
    t.real "ENERGY_BY_ACC_RESISTANCE"
    t.real "CONVERT_LOSS", null: false
    t.real "REGENE_LOSS", null: false
    t.real "REGENE_ENERGY", null: false
    t.real "LOST_ENERGY", null: false
    t.real "EFFICIENCY", null: false
    t.real "CONSUMED_ELECTRIC_ENERGY", null: false
    t.real "LOST_ENERGY_BY_WELL_TO_WHEEL"
    t.real "CONSUMED_FUEL"
    t.real "CONSUMED_FUEL_BY_WELL_TO_WHEEL"
    t.real "ENERGY_BY_EQUIPMENT"
    t.real "ENERGY_BY_COOLING"
    t.real "ENERGY_BY_HEATING"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.integer "MESH_ID"
    t.varchar "LINK_ID", limit: 14
    t.real "ROAD_THETA"
  end

  create_table "ECOLOG_SPEEDLPF0.05_MM", id: false, force: :cascade do |t|
  end

  create_table "ECOLOG_SPEEDLPF0.05_MM_LINKS_LOOKUP", id: false, force: :cascade do |t|
  end

  create_table "ECOLOG_SPEEDLPF0.05_MM_LINKS_LOOKUP2", id: false, force: :cascade do |t|
  end

  create_table "EFFICIENCY_MAP", primary_key: ["TORQUE", "REV"], force: :cascade do |t|
    t.integer "TORQUE", null: false
    t.integer "REV", null: false
    t.integer "EFFICIENCY", null: false
  end

  create_table "EFFICIENCY_MAP_MAX", primary_key: ["TORQUE", "REV"], force: :cascade do |t|
    t.integer "TORQUE", null: false
    t.integer "REV", null: false
    t.integer "EFFICIENCY", null: false
  end

  create_table "EX_FULLCHARGELOSS", id: false, force: :cascade do |t|
    t.integer "CAR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
  end

  create_table "GIDS_DIFFERENCE", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "TRIP_ID", null: false
    t.datetime "JST", null: false
    t.integer "GIDS_DIFFERENCE", null: false
  end

  create_table "GIDS_DIFFERENCE_100M_SEGMENT", primary_key: ["SEGMENT_ID", "SEMANTIC_LINK_ID", "TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "SEGMENT_ID", null: false
    t.integer "SEMANTIC_LINK_ID", null: false
    t.integer "TRIP_ID", null: false
    t.datetime "JST", null: false
    t.integer "GIDS_DIFFERENCE", null: false
  end

  create_table "GPS_TIMESTAMP_100M_SEGMENT", primary_key: ["TRIP_ID", "JST"], force: :cascade do |t|
    t.integer "SEGMENT_ID", null: false
    t.integer "SEMANTIC_LINK_ID", null: false
    t.integer "TRIP_ID", null: false
    t.datetime "JST", null: false
  end

  create_table "ILLUMINANCE_RAW", primary_key: "DATETIME", id: :datetime, default: nil, force: :cascade do |t|
    t.float "ILLUMINANCE", null: false
  end

  create_table "ILLUMINANCE_RAW_ver2", primary_key: ["DRIVER_ID", "CAR_ID", "SENSOR_ID", "DATETIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "DATETIME", null: false
    t.float "ILLUMINANCE", null: false
  end

  create_table "LEAFSPY_AC", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.float "AC_PWR", null: false
    t.float "EST_PWR_AC", null: false
    t.float "EST_PWR_HTR", null: false
    t.float "AUX_PWR", default: 0.0, null: false
  end

  create_table "LEAFSPY_RAW", primary_key: ["DRIVER_ID", "CAR_ID", "DATETIME"], force: :cascade do |t|
    t.integer "TRIP_ID"
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.datetime "DATETIME", null: false
    t.real "LAT"
    t.real "LONG"
    t.real "ELV"
    t.real "SPEED"
    t.integer "GIDS"
    t.integer "SOC"
    t.integer "AHR"
    t.real "PACK_VOLTS"
    t.real "PACK_AMPS"
    t.integer "MAX_CP_mV"
    t.integer "MIN_CP_mV"
    t.integer "AVG_CP_mV"
    t.integer "CP_mV_DIFF"
    t.integer "JUDGEMENT_VALUE"
    t.real "PACK_T1_F"
    t.real "PACK_T1_C"
    t.real "PACK_T2_F"
    t.real "PACK_T2_C"
    t.real "PACK_T3_F"
    t.real "PACK_T3_C"
    t.real "PACK_T4_F"
    t.real "PACK_T4_C"
    t.real "BATVOLT"
    t.varchar "VIN", limit: 10
    t.real "HX"
    t.real "RAW_12_BAT"
    t.integer "ODO_km"
    t.integer "QC"
    t.nchar "L1_L2", limit: 10
    t.integer "TP_FL"
    t.integer "TP_FR"
    t.integer "TP_RR"
    t.integer "TP_RL"
    t.integer "AMBIENT"
    t.integer "SOH"
    t.integer "REGENWh"
    t.integer "BLEVEL"
    t.integer "EPOCH_TIME"
    t.integer "MOTOR_PWR_100W"
    t.integer "AUX_PWR_100W"
    t.integer "AC_PWR_250W"
    t.integer "AC_PSI"
    t.integer "EST_PWR_AC_250W"
    t.integer "EST_PWR_HTR_250W"
    t.integer "PLUG_STATE"
    t.integer "CHARGE_MODE"
    t.integer "OBC_OUT_PWR"
    t.index ["TRIP_ID"], name: "leafspyall"
  end

  create_table "LEAFSPY_RAW_FULLCHARGELOSS", primary_key: ["EXPERIMENT_ID", "DATETIME"], force: :cascade do |t|
    t.integer "EXPERIMENT_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.datetime "DATETIME", null: false
    t.real "LAT"
    t.real "LONG"
    t.real "ELV"
    t.real "SPEED"
    t.integer "GIDS"
    t.integer "SOC"
    t.integer "AHR"
    t.real "PACK_VOLTS"
    t.real "PACK_AMPS"
    t.integer "MAX_CP_mV"
    t.integer "MIN_CP_mV"
    t.integer "AVG_CP_mV"
    t.integer "CP_mV_DIFF"
    t.integer "JUDGEMENT_VALUE"
    t.real "PACK_T1_F"
    t.real "PACK_T1_C"
    t.real "PACK_T2_F"
    t.real "PACK_T2_C"
    t.real "PACK_T3_F"
    t.real "PACK_T3_C"
    t.real "PACK_T4_F"
    t.real "PACK_T4_C"
    t.real "BATVOLT"
    t.varchar "VIN", limit: 10
    t.real "HX"
    t.real "RAW_12_BAT"
    t.integer "ODO_km"
    t.integer "QC"
    t.nchar "L1_L2", limit: 10
    t.integer "TP_FL"
    t.integer "TP_FR"
    t.integer "TP_RR"
    t.integer "TP_RL"
    t.integer "AMBIENT"
    t.integer "SOH"
    t.integer "REGENWh"
    t.integer "BLEVEL"
    t.integer "EPOCH_TIME"
    t.integer "MOTOR_PWR_100W"
    t.integer "AUX_PWR_100W"
    t.integer "AC_PWR_250W"
    t.integer "AC_PSI"
    t.integer "EST_PWR_AC_250W"
    t.integer "EST_PWR_HTR_250W"
    t.integer "PLUG_STATE"
    t.integer "CHARGE_MODE"
    t.integer "OBC_OUT_PWR"
  end

  create_table "LINKS", primary_key: ["NUM", "LINK_ID"], force: :cascade do |t|
    t.integer "NUM", null: false
    t.varchar "LINK_ID", limit: 14, null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.varchar "NODE_ID", limit: 14
    t.integer "DIRECTION"
    t.index ["DIRECTION", "NODE_ID"], name: "LinksforInserter"
    t.index ["LATITUDE", "LONGITUDE"], name: "CreateLinksForSearch"
    t.index ["LINK_ID", "DIRECTION", "NODE_ID"], name: "Links2forInserter"
    t.index ["LINK_ID"], name: "LinkNUMGet"
  end

  create_table "LINKS_DETAIL", primary_key: "LINK_ID", id: :varchar, limit: 14, default: nil, force: :cascade do |t|
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "START_ALTITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.nchar "END_ALTITUDE", limit: 10
    t.real "ROAD_THETA"
    t.real "ROAD_LENGTH"
    t.real "ROAD_HEADING"
  end

  create_table "LINKS_FOR_SEARCH_MIDDLE1", primary_key: ["NUM", "LINK_ID"], force: :cascade do |t|
    t.integer "NUM", null: false
    t.varchar "LINK_ID", limit: 14, null: false
    t.float "LATITUDE", null: false
    t.float "LONGITUDE", null: false
    t.varchar "NODE_ID", limit: 14
    t.integer "DIRECTION"
    t.index ["LATITUDE", "LONGITUDE"], name: "CreateLinksForSearch"
  end

  create_table "LINKS_LOOKUP", primary_key: ["KEY_LATITUDE", "KEY_LONGITUDE", "NUM", "LINK_ID"], force: :cascade do |t|
    t.integer "KEY_LATITUDE", null: false
    t.integer "KEY_LONGITUDE", null: false
    t.integer "NUM", null: false
    t.varchar "LINK_ID", limit: 14, null: false
    t.index ["LINK_ID", "KEY_LATITUDE", "KEY_LONGITUDE"], name: "<Name of Missing Index, sysname,>"
  end

  create_table "LINK_LIST", primary_key: ["SEGMENT_ID", "SEMANTIC_LINK_ID", "LINK_NUMBER"], force: :cascade do |t|
    t.integer "SEGMENT_ID", null: false
    t.integer "SEMANTIC_LINK_ID", null: false
    t.integer "LINK_NUMBER", null: false
    t.varchar "LINK_ID", limit: 14, null: false
  end

  create_table "LPF_SPEED", primary_key: ["CUT_OFF_FREQUENCY", "DATETIME", "DRIVER_ID", "CAR_ID", "SENSOR_ID"], force: :cascade do |t|
    t.real "CUT_OFF_FREQUENCY", null: false
    t.datetime "DATETIME", null: false
    t.real "SPEED", null: false
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
  end

  create_table "MEMOS", id: false, force: :cascade do |t|
    t.date "DATE", null: false
    t.varchar "TRIP_DIRECTION", limit: 50
    t.boolean "HODOGAYA"
    t.boolean "A/C"
    t.boolean "DEFROSTER"
    t.boolean "TIMER"
    t.integer "CH"
    t.integer "START_GIDS"
    t.boolean "END_GIDS"
    t.float "AVERAGE_ELECTRICITY_EXPENSE"
    t.boolean "ELECTRICITY_EXPENSE_RESET"
    t.varchar_max "REMARKS"
  end

  create_table "PICTURE_RAW", primary_key: ["DRIVER_ID", "SENSOR_ID", "CAPTURED_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "CAPTURED_TIME", null: false
    t.varchar_max "PICTURE", null: false
  end

  create_table "SEMANTIC_LINKS", primary_key: ["SEMANTIC_LINK_ID", "DRIVER_ID", "LINK_ID"], force: :cascade do |t|
    t.integer "SEMANTIC_LINK_ID", null: false
    t.integer "DRIVER_ID", null: false
    t.varchar "LINK_ID", limit: 14, null: false
    t.string "SEMANTICS", limit: 30
  end

  create_table "SENSORS", primary_key: "SENSOR_ID", id: :integer, default: nil, force: :cascade do |t|
    t.varchar "SENSOR_MODEL", limit: 20
    t.varchar "BRAND", limit: 20
    t.real "OS_VERSION"
    t.integer "ORDINAL"
  end

  create_table "TRIPS", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.real "CONSUMED_ENERGY"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.varchar "VALIDATION", limit: 10
  end

  create_table "TRIPS_LINKS_LOOKUP", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.real "CONSUMED_ENERGY"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.varchar "VALIDATION", limit: 10
  end

  create_table "TRIPS_LINKS_LOOKUP2", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.real "CONSUMED_ENERGY"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.varchar "VALIDATION", limit: 10
  end

  create_table "TRIPS_LPF_EX_LINKS_LOOKUP", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.real "CONSUMED_ENERGY"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.varchar "VALIDATION", limit: 10
  end

  create_table "TRIPS_MM_LINKS_LOOKUP", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.real "CONSUMED_ENERGY"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.varchar "VALIDATION", limit: 10
  end

  create_table "TRIPS_MM_LINKS_LOOKUP2", primary_key: "TRIP_ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
    t.real "CONSUMED_ENERGY"
    t.varchar "TRIP_DIRECTION", limit: 10
    t.varchar "VALIDATION", limit: 10
  end

  create_table "TRIPS_RAW", primary_key: ["DRIVER_ID", "SENSOR_ID", "START_TIME", "END_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
  end

  create_table "TRIPS_RAW_LINKS_LOOKUP", primary_key: ["DRIVER_ID", "SENSOR_ID", "START_TIME", "END_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
  end

  create_table "TRIPS_RAW_LINKS_LOOKUP2", primary_key: ["DRIVER_ID", "SENSOR_ID", "START_TIME", "END_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
  end

  create_table "TRIPS_RAW_LPF_EX_LINKS_LOOKUP", primary_key: ["DRIVER_ID", "SENSOR_ID", "START_TIME", "END_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
  end

  create_table "TRIPS_RAW_MM_LINKS_LOOKUP", primary_key: ["DRIVER_ID", "SENSOR_ID", "START_TIME", "END_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
  end

  create_table "TRIPS_RAW_MM_LINKS_LOOKUP2", primary_key: ["DRIVER_ID", "SENSOR_ID", "START_TIME", "END_TIME"], force: :cascade do |t|
    t.integer "DRIVER_ID", null: false
    t.integer "CAR_ID", null: false
    t.integer "SENSOR_ID", null: false
    t.datetime "START_TIME", null: false
    t.datetime "END_TIME", null: false
    t.float "START_LATITUDE"
    t.float "START_LONGITUDE"
    t.float "END_LATITUDE"
    t.float "END_LONGITUDE"
  end

  create_table "TRIPS_RAW_SPEEDLPF0.05_MM", id: false, force: :cascade do |t|
  end

  create_table "TRIPS_RAW_SPEEDLPF0.05_MM_LINKS_LOOKUP", id: false, force: :cascade do |t|
  end

  create_table "TRIPS_RAW_SPEEDLPF0.05_MM_LINKS_LOOKUP2", id: false, force: :cascade do |t|
  end

  create_table "TRIPS_SPEEDLPF0.05_MM", id: false, force: :cascade do |t|
  end

  create_table "TRIPS_SPEEDLPF0.05_MM_LINKS_LOOKUP", id: false, force: :cascade do |t|
  end

  create_table "TRIPS_SPEEDLPF0.05_MM_LINKS_LOOKUP2", id: false, force: :cascade do |t|
  end

  create_table "WEATHER", primary_key: ["PLACE", "DATETIME"], force: :cascade do |t|
    t.string "PLACE", limit: 20, null: false
    t.datetime "DATETIME", null: false
    t.datetime "LAST_10MIN_DATETIME", null: false
    t.real "BAROMETRIC_VALUE", null: false
    t.real "ATMOSPHERIC_PRESSURE", null: false
    t.real "PRECIPITATION", null: false
    t.real "TEMPERATURE", null: false
    t.integer "HUMIDITY", null: false
    t.real "WIND_SPEED", null: false
    t.string "WIND_DIRECTION", limit: 10, null: false
    t.real "MAX_WIND_SPEED", null: false
    t.varchar "MAX_WIND_DIRECTION", limit: 10, null: false
    t.integer "SUNLIGHT"
  end

  create_table "sysdiagrams", primary_key: "diagram_id", id: :integer, force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.integer "principal_id", null: false
    t.integer "version"
    t.binary "definition"
    t.index ["principal_id", "name"], name: "UK_principal_name", unique: true
  end

  create_table "titles", force: :cascade do |t|
    t.string "name"
    t.date "sales_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ANDROID_ACC_RAW", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_ANDROID_ACC_RAW_CARS"
  add_foreign_key "ANDROID_ACC_RAW", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_ANDROID_ACC_RAW_DRIVERS"
  add_foreign_key "ANDROID_ACC_RAW", "SENSORS", column: "SENSOR_ID", primary_key: "SENSOR_ID", name: "FK_ANDROID_ACC_RAW_SENSORS"
  add_foreign_key "ANDROID_GPS_RAW", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_ANDROID_GPS_RAW_CARS"
  add_foreign_key "ANDROID_GPS_RAW", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_ANDROID_GPS_RAW_DRIVERS"
  add_foreign_key "ANDROID_GPS_RAW", "SENSORS", column: "SENSOR_ID", primary_key: "SENSOR_ID", name: "FK_ANDROID_GPS_RAW_SENSORS"
  add_foreign_key "CORRECTED_ACC", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_CORRECTED_ACC_CARS"
  add_foreign_key "CORRECTED_ACC", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_CORRECTED_ACC_DRIVERS"
  add_foreign_key "CORRECTED_ACC", "SENSORS", column: "SENSOR_ID", primary_key: "SENSOR_ID", name: "FK_CORRECTED_ACC_SENSORS"
  add_foreign_key "CORRECTED_GPS", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_CORRECTED_GPS_CARS"
  add_foreign_key "CORRECTED_GPS", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_CORRECTED_GPS_DRIVERS"
  add_foreign_key "CORRECTED_GPS", "SENSORS", column: "SENSOR_ID", primary_key: "SENSOR_ID", name: "FK_CORRECTED_GPS_SENSORS"
  add_foreign_key "CORRECTED_PICTURE", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_CORRECTED_PICTURE_CARS"
  add_foreign_key "CORRECTED_PICTURE", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_CORRECTED_PICTURE_DRIVERS"
  add_foreign_key "ECOLOG", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_ECOLOG_CARS"
  add_foreign_key "ECOLOG", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_ECOLOG_DRIVERS"
  add_foreign_key "ECOLOG", "SENSORS", column: "SENSOR_ID", primary_key: "SENSOR_ID", name: "FK_ECOLOG_SENSORS"
  add_foreign_key "LEAFSPY_RAW", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_LEAFSPY_RAW_CARS"
  add_foreign_key "LEAFSPY_RAW", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_LEAFSPY_RAW_DRIVERS"
  add_foreign_key "PICTURE_RAW", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_PICTURE_RAW_CARS"
  add_foreign_key "PICTURE_RAW", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_PICTURE_RAW_DRIVERS"
  add_foreign_key "TRIPS", "CARS", column: "CAR_ID", primary_key: "CAR_ID", name: "FK_TRIPS_CARS"
  add_foreign_key "TRIPS", "DRIVERS", column: "DRIVER_ID", primary_key: "DRIVER_ID", name: "FK_TRIPS_DRIVERS"
  add_foreign_key "TRIPS", "SENSORS", column: "SENSOR_ID", primary_key: "SENSOR_ID", name: "FK_TRIPS_SENSORS"
end
