-- note that this package should not be with'ed by any unit
-- that is ultimately with'ed by startup code.
-- As this will cause errors like following,
-- because of duplicate symbol exporting within both startup code and main.
-- >make all
--      arm-eabi-gcc.exe -c -g -mcpu=cortex-m4 -mthumb -mfloat-abi=soft --RTS=../RTS_minimal_stm32f4/ -o startup.o startup.adb
--      startup.ads:76:37: external name duplicates name given at pack_1.ads:9
--      make: *** [startup.o] Error 1

package handlers is

    procedure NMI_Handler
    with
        Export,
        Convention => C,
        External_Name => "NMI_Handler";

    procedure HardFault_Handler
    with
        Export,
        Convention => Ada,
        External_Name => "HardFault_Handler";

    procedure BusFault_Handler
    with
        Export,
        Convention => Ada,
        External_Name => "BusFault_Handler";

    procedure UsageFault_Handler
    with
        Export,
        Convention => Ada,
        External_Name => "UsageFault_Handler";


    procedure MemManage_Handler
    with
        Export,
        Convention => Ada,
        External_Name => "MemManage_Handler";

end handlers;