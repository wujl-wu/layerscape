################################################################################
#
# libopen62541
#
################################################################################

LIBOPEN62541_VERSION = v1.1.2
LIBOPEN62541_SITE = https://github.com/open62541/open62541.git
LIBOPEN62541_SITE_METHOD = git
LIBOPEN62541_LICENSE = MOZILLA
LIBOPEN62541_LICENSE_FILES = LICENSE
LIBOPEN62541_INSTALL_STAGING = YES
LIBOPEN62541_GIT_SUBMODULES=YES

ifeq ($(BR2_PACKAGE_LIBOPEN62541_CMAKE_BUILD_TYPE_RELWITHdEBINFO),y)
	LIBOPEN62541_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_CMAKE_BUILD_TYPE_RELEASE),y)
	LIBOPEN62541_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_CMAKE_BUILD_TYPE_DEBUG),y)
	LIBOPEN62541_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
endif
ifeq ($(BR2_PACKAGE_LIBOPEN62541_CMAKE_BUILD_TYPE_MINSIZEREL),y)
	LIBOPEN62541_CONF_OPTS += -DCMAKE_BUILD_TYPE=MinSizeRel
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_LOG_FATAL),y)
	LIBOPEN62541_CONF_OPTS += -DUA_LOGLEVEL=600
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_LOG_ERROR),y)
	LIBOPEN62541_CONF_OPTS += -DUA_LOGLEVEL=500
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_LOG_WARNING),y)
	LIBOPEN62541_CONF_OPTS += -DUA_LOGLEVEL=400
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_LOG_INFO),y)
	LIBOPEN62541_CONF_OPTS += -DUA_LOGLEVEL=300
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_LOG_DEBUG),y)
	LIBOPEN62541_CONF_OPTS += -DUA_LOGLEVEL=200
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_LOG_TRACE),y)
	LIBOPEN62541_CONF_OPTS += -DUA_LOGLEVEL=100
endif

multithreading=$(call qstrip,$(BR2_PACKAGE_LIBOPEN62541_MULTITHREADING))
LIBOPEN62541_CONF_OPTS += -DUA_MULTITHREADING=$(multithreading)

ifeq ($(BR2_PACKAGE_LIBOPEN62541_BUILD_UNIT_TESTS),y)
	LIBOPEN62541_CONF_OPTS += -DUA_BUILD_UNIT_TESTS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_BUILD_SELFSIGNED_CERTIFICATE),y)
	LIBOPEN62541_CONF_OPTS += -DUA_BUILD_SELFSIGNED_CERTIFICATE=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_SUBSCRIPTIONS),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_SUBSCRIPTIONS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_SUBSCRIPTIONS_EVENTS),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_SUBSCRIPTIONS_EVENTS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_ALARMS_CONDITION),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_SUBSCRIPTIONS_ALARMS_CONDITIONS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_METHODCALLS),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_METHODCALLS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_PARSING),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_PARSING=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_NODEMANAGEMENT),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_NODEMANAGEMENT=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_AMALGAMATION),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_AMALGAMATION=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_IMMUTABLE_NODES),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_IMMUTABLE_NODES=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_COVERAGE),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_COVERAGE=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_DISCOVERY),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_DISCOVERY),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY_MULTICAST=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_DISCOVERY_SEMAPHORE),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_DISCOVERY_SEMAPHORE=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_NAMESPACE_ZERO_MINIMAL),y)
	LIBOPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_NAMESPACE_ZERO_REDUCED),y)
	LIBOPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=REDUCED
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_NAMESPACE_ZERO_FULL),y)
	LIBOPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=FULL
endif

ifneq ($(call qstrip,$(BR2_PACKAGE_LIBOPEN62541_UA_FILE_NS0)),)
	ua_file_ns0=$(call qstrip,$(BR2_PACKAGE_LIBOPEN62541_UA_FILE_NS0))
	LIBOPEN62541_CONF_OPTS += -DUA_FILE_NS0=$(ua_file_ns0)
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_TYPEDESCRIPTION),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_TYPEDESCRIPTION=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_ENABLE_STATUSCODE_DESCRIPTIONS),y)
	LIBOPEN62541_CONF_OPTS += -DUA_ENABLE_STATUSCODE_DESCRIPTIONS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_BUILD_SHARED_LIBS),y)
	LIBOPEN62541_CONF_OPTS += -DBUILD_SHARED_LIBS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_UA_DEBUG),y)
	LIBOPEN62541_CONF_OPTS += -DUA_DEBUG=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_UA_DEBUG_DUMP_PKGS),y)
	LIBOPEN62541_CONF_OPTS += -DUA_DEBUG_DUMP_PKGS=ON
endif

ifeq ($(BR2_PACKAGE_LIBOPEN62541_BUILD_EXAMPLES),y)
	LIBOPEN62541_CONF_OPTS += -DUA_BUILD_EXAMPLES=ON

OPEN62541_EXAMPLES = \
	access_control_client \
	access_control_server \
	client \
	client_async \
	client_connect \
	client_connectivitycheck_loop \
	client_connect_loop \
	client_subscription_loop \
	custom_datatype_client \
	custom_datatype_server \
	server_ctt \
	server_inheritance \
	server_instantiation \
	server_loglevel \
	server_mainloop \
	server_nodeset \
	server_repeated_job \
	tutorial_client_events \
	tutorial_client_firststeps \
	tutorial_datatypes \
	tutorial_server_datasource \
	tutorial_server_firststeps \
	tutorial_server_method \
	tutorial_server_monitoreditems \
	tutorial_server_object \
	tutorial_server_variable \
	tutorial_server_variabletype

define OPEN62541_INSTALL_EXAMPLES
	$(foreach example, $(OPEN62541_EXAMPLES),
		$(INSTALL) -m 0755 -D $(BUILD_DIR)/libopen62541-$(LIBOPEN62541_VERSION)/bin/examples/$(example) \
			$(TARGET_DIR)/usr/bin/open62541_$(example);)
endef

LIBOPEN62541_POST_INSTALL_TARGET_HOOKS += OPEN62541_INSTALL_EXAMPLES

endif

$(eval $(cmake-package))