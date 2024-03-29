PROGRAM = sonoff_basic

EXTRA_COMPONENTS = \
	extras/http-parser \
	extras/dhcpserver \
	$(ESP_HOMEKIT_DEMO)/components/esp8266-open-rtos/wifi_config \
	$(ESP_HOMEKIT_DEMO)/components/esp8266-open-rtos/cJSON \
	$(ESP_HOMEKIT_DEMO)/components/common/wolfssl \
	$(ESP_HOMEKIT_DEMO)/components/common/homekit

FLASH_SIZE ?= 4MB
FLASH_MODE ?= dout
FLASH_SPEED ?= 40
HOMEKIT_SPI_FLASH_BASE_ADDR ?= 0x7A000

EXTRA_CFLAGS += -I../.. -DHOMEKIT_SHORT_APPLE_UUIDS

include $(SDK_PATH)/common.mk

monitor:
	$(FILTEROUTPUT) --port $(ESPPORT) --baud 115200 --elf $(PROGRAM_OUT)
