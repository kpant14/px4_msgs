# GPS position in WGS84 coordinates.
# the field 'timestamp' is for the position & velocity (microseconds)
uint64 timestamp		# time since system start (microseconds)
uint64 timestamp_sample

uint32 device_id                # unique device ID for the sensor that does not change between power cycles

int32 lat			# Latitude in 1E-7 degrees
int32 lon			# Longitude in 1E-7 degrees
int32 alt			# Altitude in 1E-3 meters above MSL, (millimetres)
int32 alt_ellipsoid 		# Altitude in 1E-3 meters bove Ellipsoid, (millimetres)

float32 s_variance_m_s		# GPS speed accuracy estimate, (metres/sec)
float32 c_variance_rad		# GPS course accuracy estimate, (radians)
uint8 fix_type # 0-1: no fix, 2: 2D fix, 3: 3D fix, 4: RTCM code differential, 5: Real-Time Kinematic, float, 6: Real-Time Kinematic, fixed, 8: Extrapolated. Some applications will not use the value of this field unless it is at least two, so always correctly fill in the fix.

float32 eph			# GPS horizontal position accuracy (metres)
float32 epv			# GPS vertical position accuracy (metres)

float32 hdop			# Horizontal dilution of precision
float32 vdop			# Vertical dilution of precision

int32 noise_per_ms		# GPS noise per millisecond
uint16 automatic_gain_control   # Automatic gain control monitor

uint8 JAMMING_STATE_UNKNOWN  = 0
uint8 JAMMING_STATE_OK       = 1
uint8 JAMMING_STATE_WARNING  = 2
uint8 JAMMING_STATE_CRITICAL = 3
uint8 jamming_state		# indicates whether jamming has been detected or suspected by the receivers. O: Unknown, 1: OK, 2: Warning, 3: Critical
int32 jamming_indicator		# indicates jamming is occurring

uint8 SPOOFING_STATE_UNKNOWN   = 0
uint8 SPOOFING_STATE_NONE      = 1
uint8 SPOOFING_STATE_INDICATED = 2
uint8 SPOOFING_STATE_MULTIPLE  = 3
uint8 spoofing_state		# indicates whether spoofing has been detected or suspected by the receivers. O: Unknown, 1: OK, 2: Warning, 3: Critical

float32 vel_m_s			# GPS ground speed, (metres/sec)
float32 vel_n_m_s		# GPS North velocity, (metres/sec)
float32 vel_e_m_s		# GPS East velocity, (metres/sec)
float32 vel_d_m_s		# GPS Down velocity, (metres/sec)
float32 cog_rad			# Course over ground (NOT heading, but direction of movement), -PI..PI, (radians)
bool vel_ned_valid		# True if NED velocity is valid

int32 timestamp_time_relative	# timestamp + timestamp_time_relative = Time of the UTC timestamp since system start, (microseconds)
uint64 time_utc_usec		# Timestamp (microseconds, UTC), this is the timestamp which comes from the gps module. It might be unavailable right after cold start, indicated by a value of 0

uint8 satellites_used		# Number of satellites used

float32 heading			# heading angle of XYZ body frame rel to NED. Set to NaN if not available and updated (used for dual antenna GPS), (rad, [-PI, PI])
float32 heading_offset		# heading offset of dual antenna array in body frame. Set to NaN if not applicable. (rad, [-PI, PI])
float32 heading_accuracy	# heading accuracy (rad, [0, 2PI])

float32 rtcm_injection_rate	# RTCM message injection rate Hz
uint8 selected_rtcm_instance	# uorb instance that is being used for RTCM corrections

# TOPICS sensor_gps vehicle_gps_position