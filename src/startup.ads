with System;
with Ada.Unchecked_Conversion;
with Interfaces; use Interfaces;



package startup is


    function Addr_To_U32 is new Ada.Unchecked_Conversion(Source => System.Address, Target => Unsigned_32);

    function U32_To_Addr is new Ada.Unchecked_Conversion(Source => Unsigned_32, Target => System.Address);

    type Address_Array is array (Unsigned_8 range <>) of System.Address;

    type Section_Array is array (Unsigned_32 range <>) of Unsigned_8;

    SRAM_Start  : constant Unsigned_32 := 16#2000_0000#;
    SRAM_Size   : constant Unsigned_32 := 16#0002_0000#;    -- 128 KB
    Stack_Start : constant System.Address := System'To_Address(SRAM_Start + SRAM_Size);

    --Reserved_Address : constant System.Address := U32_To_Addr(16#0000_0000#);
    Reserved_Address : constant System.Address := System'To_Address(16#0000_0000#);
    
    procedure main_app
    with
        Import,
        Convention => Ada,
        External_Name => "main_app";

    procedure last_chance_handler;
    pragma Export(Ada, last_chance_handler, "__gnat_last_chance_handler");
    
    procedure Default_Procedure
    with
        Export,
        Convention => Ada,
        External_Name => "Default_Handler";

    procedure Reset_Handler
    with
        Export,
        Convention => Ada,
        External_Name => "Reset_Handler";


    -- The weak procedures declarations
    procedure NMI_Handler;
    pragma Export(Ada, NMI_Handler, "NMI_Handler");         -- export as NMI_Handler symbol
    pragma Weak_External (NMI_Handler);                     -- decalre as a weak symbol
    pragma Linker_Alias (NMI_Handler, "Default_Handler");   -- Alias to Default_Handler if implementation not found elsewhere

    procedure HardFault_Handler;
    pragma Export(Ada, HardFault_Handler, "HardFault_Handler");
    pragma Weak_External (HardFault_Handler);
    pragma Linker_Alias (HardFault_Handler, "Default_Handler");

    procedure MemManage_Handler;
    pragma Export(Ada, MemManage_Handler, "MemManage_Handler");
    pragma Weak_External (MemManage_Handler);
    pragma Linker_Alias (MemManage_Handler, "Default_Handler");

    procedure BusFault_Handler;
    pragma Export(Ada, BusFault_Handler, "BusFault_Handler");
    pragma Weak_External (BusFault_Handler);
    pragma Linker_Alias (BusFault_Handler, "Default_Handler");

    procedure UsageFault_Handler;
    pragma Export(Ada, UsageFault_Handler, "UsageFault_Handler");
    pragma Weak_External (UsageFault_Handler);
    pragma Linker_Alias (UsageFault_Handler, "Default_Handler");

    procedure SVC_Handler;
    pragma Export(Ada, SVC_Handler, "SVC_Handler");
    pragma Weak_External (SVC_Handler);
    pragma Linker_Alias (SVC_Handler, "Default_Handler");

    procedure DebugMon_Handler;
    pragma Export(Ada, DebugMon_Handler, "DebugMon_Handler");
    pragma Weak_External (DebugMon_Handler);
    pragma Linker_Alias (DebugMon_Handler, "Default_Handler");

    procedure PendSV_Handler;
    pragma Export(Ada, PendSV_Handler, "PendSV_Handler");
    pragma Weak_External (PendSV_Handler);
    pragma Linker_Alias (PendSV_Handler, "Default_Handler");

    procedure SysTick_Handler;
    pragma Export(Ada, SysTick_Handler, "SysTick_Handler");
    pragma Weak_External (SysTick_Handler);
    pragma Linker_Alias (SysTick_Handler, "Default_Handler");

    procedure WWDG_IRQHandler;
    pragma Export(Ada, WWDG_IRQHandler, "WWDG_IRQHandler");
    pragma Weak_External (WWDG_IRQHandler);
    pragma Linker_Alias (WWDG_IRQHandler, "Default_Handler");

    procedure PVD_IRQHandler;
    pragma Export(Ada, PVD_IRQHandler, "PVD_IRQHandler");
    pragma Weak_External (PVD_IRQHandler);
    pragma Linker_Alias (PVD_IRQHandler, "Default_Handler");

    procedure TAMP_STAMP_IRQHandler;
    pragma Export(Ada, TAMP_STAMP_IRQHandler, "TAMP_STAMP_IRQHandler");
    pragma Weak_External (TAMP_STAMP_IRQHandler);
    pragma Linker_Alias (TAMP_STAMP_IRQHandler, "Default_Handler");

    procedure RTC_WKUP_IRQHandler;
    pragma Export(Ada, RTC_WKUP_IRQHandler, "RTC_WKUP_IRQHandler");
    pragma Weak_External (RTC_WKUP_IRQHandler);
    pragma Linker_Alias (RTC_WKUP_IRQHandler, "Default_Handler");

    procedure RCC_IRQHandler;
    pragma Export(Ada, RCC_IRQHandler, "RCC_IRQHandler");
    pragma Weak_External (RCC_IRQHandler);
    pragma Linker_Alias (RCC_IRQHandler, "Default_Handler");

    procedure EXTI0_IRQHandler;
    pragma Export(Ada, EXTI0_IRQHandler, "EXTI0_IRQHandler");
    pragma Weak_External (EXTI0_IRQHandler);
    pragma Linker_Alias (EXTI0_IRQHandler, "Default_Handler");

    procedure EXTI1_IRQHandler;
    pragma Export(Ada, EXTI1_IRQHandler, "EXTI1_IRQHandler");
    pragma Weak_External (EXTI1_IRQHandler);
    pragma Linker_Alias (EXTI1_IRQHandler, "Default_Handler");

    procedure EXTI2_IRQHandler;
    pragma Export(Ada, EXTI2_IRQHandler, "EXTI2_IRQHandler");
    pragma Weak_External (EXTI2_IRQHandler);
    pragma Linker_Alias (EXTI2_IRQHandler, "Default_Handler");

    procedure EXTI3_IRQHandler;
    pragma Export(Ada, EXTI3_IRQHandler, "EXTI3_IRQHandler");
    pragma Weak_External (EXTI3_IRQHandler);
    pragma Linker_Alias (EXTI3_IRQHandler, "Default_Handler");

    procedure EXTI4_IRQHandler;
    pragma Export(Ada, EXTI4_IRQHandler, "EXTI4_IRQHandler");
    pragma Weak_External (EXTI4_IRQHandler);
    pragma Linker_Alias (EXTI4_IRQHandler, "Default_Handler");

    procedure DMA1_Stream0_IRQHandler;
    pragma Export(Ada, DMA1_Stream0_IRQHandler, "DMA1_Stream0_IRQHandler");
    pragma Weak_External (DMA1_Stream0_IRQHandler);
    pragma Linker_Alias (DMA1_Stream0_IRQHandler, "Default_Handler");

    procedure DMA1_Stream1_IRQHandler;
    pragma Export(Ada, DMA1_Stream1_IRQHandler, "DMA1_Stream1_IRQHandler");
    pragma Weak_External (DMA1_Stream1_IRQHandler);
    pragma Linker_Alias (DMA1_Stream1_IRQHandler, "Default_Handler");

    procedure DMA1_Stream2_IRQHandler;
    pragma Export(Ada, DMA1_Stream2_IRQHandler, "DMA1_Stream2_IRQHandler");
    pragma Weak_External (DMA1_Stream2_IRQHandler);
    pragma Linker_Alias (DMA1_Stream2_IRQHandler, "Default_Handler");

    procedure DMA1_Stream3_IRQHandler;
    pragma Export(Ada, DMA1_Stream3_IRQHandler, "DMA1_Stream3_IRQHandler");
    pragma Weak_External (DMA1_Stream3_IRQHandler);
    pragma Linker_Alias (DMA1_Stream3_IRQHandler, "Default_Handler");

    procedure DMA1_Stream4_IRQHandler;
    pragma Export(Ada, DMA1_Stream4_IRQHandler, "DMA1_Stream4_IRQHandler");
    pragma Weak_External (DMA1_Stream4_IRQHandler);
    pragma Linker_Alias (DMA1_Stream4_IRQHandler, "Default_Handler");

    procedure DMA1_Stream5_IRQHandler;
    pragma Export(Ada, DMA1_Stream5_IRQHandler, "DMA1_Stream5_IRQHandler");
    pragma Weak_External (DMA1_Stream5_IRQHandler);
    pragma Linker_Alias (DMA1_Stream5_IRQHandler, "Default_Handler");

    procedure DMA1_Stream6_IRQHandler;
    pragma Export(Ada, DMA1_Stream6_IRQHandler, "DMA1_Stream6_IRQHandler");
    pragma Weak_External (DMA1_Stream6_IRQHandler);
    pragma Linker_Alias (DMA1_Stream6_IRQHandler, "Default_Handler");

    procedure ADC_IRQHandler;
    pragma Export(Ada, ADC_IRQHandler, "ADC_IRQHandler");
    pragma Weak_External (ADC_IRQHandler);
    pragma Linker_Alias (ADC_IRQHandler, "Default_Handler");

    procedure CAN1_TX_IRQHandler;
    pragma Export(Ada, CAN1_TX_IRQHandler, "CAN1_TX_IRQHandler");
    pragma Weak_External (CAN1_TX_IRQHandler);
    pragma Linker_Alias (CAN1_TX_IRQHandler, "Default_Handler");

    procedure CAN1_RX0_IRQHandler;
    pragma Export(Ada, CAN1_RX0_IRQHandler, "CAN1_RX0_IRQHandler");
    pragma Weak_External (CAN1_RX0_IRQHandler);
    pragma Linker_Alias (CAN1_RX0_IRQHandler, "Default_Handler");

    procedure CAN1_RX1_IRQHandler;
    pragma Export(Ada, CAN1_RX1_IRQHandler, "CAN1_RX1_IRQHandler");
    pragma Weak_External (CAN1_RX1_IRQHandler);
    pragma Linker_Alias (CAN1_RX1_IRQHandler, "Default_Handler");

    procedure CAN1_SCE_IRQHandler;
    pragma Export(Ada, CAN1_SCE_IRQHandler, "CAN1_SCE_IRQHandler");
    pragma Weak_External (CAN1_SCE_IRQHandler);
    pragma Linker_Alias (CAN1_SCE_IRQHandler, "Default_Handler");

    procedure EXTI9_5_IRQHandler;
    pragma Export(Ada, EXTI9_5_IRQHandler, "EXTI9_5_IRQHandler");
    pragma Weak_External (EXTI9_5_IRQHandler);
    pragma Linker_Alias (EXTI9_5_IRQHandler, "Default_Handler");

    procedure TIM1_BRK_TIM9_IRQHandler;
    pragma Export(Ada, TIM1_BRK_TIM9_IRQHandler, "TIM1_BRK_TIM9_IRQHandler");
    pragma Weak_External (TIM1_BRK_TIM9_IRQHandler);
    pragma Linker_Alias (TIM1_BRK_TIM9_IRQHandler, "Default_Handler");

    procedure TIM1_UP_TIM10_IRQHandler;
    pragma Export(Ada, TIM1_UP_TIM10_IRQHandler, "TIM1_UP_TIM10_IRQHandler");
    pragma Weak_External (TIM1_UP_TIM10_IRQHandler);
    pragma Linker_Alias (TIM1_UP_TIM10_IRQHandler, "Default_Handler");

    procedure TIM1_TRG_COM_TIM11_IRQHandler;
    pragma Export(Ada, TIM1_TRG_COM_TIM11_IRQHandler, "TIM1_TRG_COM_TIM11_IRQHandler");
    pragma Weak_External (TIM1_TRG_COM_TIM11_IRQHandler);
    pragma Linker_Alias (TIM1_TRG_COM_TIM11_IRQHandler, "Default_Handler");

    procedure TIM1_CC_IRQHandler;
    pragma Export(Ada, TIM1_CC_IRQHandler, "TIM1_CC_IRQHandler");
    pragma Weak_External (TIM1_CC_IRQHandler);
    pragma Linker_Alias (TIM1_CC_IRQHandler, "Default_Handler");

    procedure TIM2_IRQHandler;
    pragma Export(Ada, TIM2_IRQHandler, "TIM2_IRQHandler");
    pragma Weak_External (TIM2_IRQHandler);
    pragma Linker_Alias (TIM2_IRQHandler, "Default_Handler");

    procedure TIM3_IRQHandler;
    pragma Export(Ada, TIM3_IRQHandler, "TIM3_IRQHandler");
    pragma Weak_External (TIM3_IRQHandler);
    pragma Linker_Alias (TIM3_IRQHandler, "Default_Handler");

    procedure TIM4_IRQHandler;
    pragma Export(Ada, TIM4_IRQHandler, "TIM4_IRQHandler");
    pragma Weak_External (TIM4_IRQHandler);
    pragma Linker_Alias (TIM4_IRQHandler, "Default_Handler");

    procedure I2C1_EV_IRQHandler;
    pragma Export(Ada, I2C1_EV_IRQHandler, "I2C1_EV_IRQHandler");
    pragma Weak_External (I2C1_EV_IRQHandler);
    pragma Linker_Alias (I2C1_EV_IRQHandler, "Default_Handler");

    procedure I2C1_ER_IRQHandler;
    pragma Export(Ada, I2C1_ER_IRQHandler, "I2C1_ER_IRQHandler");
    pragma Weak_External (I2C1_ER_IRQHandler);
    pragma Linker_Alias (I2C1_ER_IRQHandler, "Default_Handler");

    procedure I2C2_EV_IRQHandler;
    pragma Export(Ada, I2C2_EV_IRQHandler, "I2C2_EV_IRQHandler");
    pragma Weak_External (I2C2_EV_IRQHandler);
    pragma Linker_Alias (I2C2_EV_IRQHandler, "Default_Handler");

    procedure I2C2_ER_IRQHandler;
    pragma Export(Ada, I2C2_ER_IRQHandler, "I2C2_ER_IRQHandler");
    pragma Weak_External (I2C2_ER_IRQHandler);
    pragma Linker_Alias (I2C2_ER_IRQHandler, "Default_Handler");

    procedure SPI1_IRQHandler;
    pragma Export(Ada, SPI1_IRQHandler, "SPI1_IRQHandler");
    pragma Weak_External (SPI1_IRQHandler);
    pragma Linker_Alias (SPI1_IRQHandler, "Default_Handler");

    procedure SPI2_IRQHandler;
    pragma Export(Ada, SPI2_IRQHandler, "SPI2_IRQHandler");
    pragma Weak_External (SPI2_IRQHandler);
    pragma Linker_Alias (SPI2_IRQHandler, "Default_Handler");

    procedure USART1_IRQHandler;
    pragma Export(Ada, USART1_IRQHandler, "USART1_IRQHandler");
    pragma Weak_External (USART1_IRQHandler);
    pragma Linker_Alias (USART1_IRQHandler, "Default_Handler");

    procedure USART2_IRQHandler;
    pragma Export(Ada, USART2_IRQHandler, "USART2_IRQHandler");
    pragma Weak_External (USART2_IRQHandler);
    pragma Linker_Alias (USART2_IRQHandler, "Default_Handler");

    procedure USART3_IRQHandler;
    pragma Export(Ada, USART3_IRQHandler, "USART3_IRQHandler");
    pragma Weak_External (USART3_IRQHandler);
    pragma Linker_Alias (USART3_IRQHandler, "Default_Handler");

    procedure EXTI15_10_IRQHandler;
    pragma Export(Ada, EXTI15_10_IRQHandler, "EXTI15_10_IRQHandler");
    pragma Weak_External (EXTI15_10_IRQHandler);
    pragma Linker_Alias (EXTI15_10_IRQHandler, "Default_Handler");

    procedure RTC_Alarm_IRQHandler;
    pragma Export(Ada, RTC_Alarm_IRQHandler, "RTC_Alarm_IRQHandler");
    pragma Weak_External (RTC_Alarm_IRQHandler);
    pragma Linker_Alias (RTC_Alarm_IRQHandler, "Default_Handler");

    procedure OTG_FS_WKUP_IRQHandler;
    pragma Export(Ada, OTG_FS_WKUP_IRQHandler, "OTG_FS_WKUP_IRQHandler");
    pragma Weak_External (OTG_FS_WKUP_IRQHandler);
    pragma Linker_Alias (OTG_FS_WKUP_IRQHandler, "Default_Handler");

    procedure TIM8_BRK_TIM12_IRQHandler;
    pragma Export(Ada, TIM8_BRK_TIM12_IRQHandler, "TIM8_BRK_TIM12_IRQHandler");
    pragma Weak_External (TIM8_BRK_TIM12_IRQHandler);
    pragma Linker_Alias (TIM8_BRK_TIM12_IRQHandler, "Default_Handler");

    procedure TIM8_UP_TIM13_IRQHandler;
    pragma Export(Ada, TIM8_UP_TIM13_IRQHandler, "TIM8_UP_TIM13_IRQHandler");
    pragma Weak_External (TIM8_UP_TIM13_IRQHandler);
    pragma Linker_Alias (TIM8_UP_TIM13_IRQHandler, "Default_Handler");

    procedure TIM8_TRG_COM_TIM14_IRQHandler;
    pragma Export(Ada, TIM8_TRG_COM_TIM14_IRQHandler, "TIM8_TRG_COM_TIM14_IRQHandler");
    pragma Weak_External (TIM8_TRG_COM_TIM14_IRQHandler);
    pragma Linker_Alias (TIM8_TRG_COM_TIM14_IRQHandler, "Default_Handler");

    procedure TIM8_CC_IRQHandler;
    pragma Export(Ada, TIM8_CC_IRQHandler, "TIM8_CC_IRQHandler");
    pragma Weak_External (TIM8_CC_IRQHandler);
    pragma Linker_Alias (TIM8_CC_IRQHandler, "Default_Handler");

    procedure DMA1_Stream7_IRQHandler;
    pragma Export(Ada, DMA1_Stream7_IRQHandler, "DMA1_Stream7_IRQHandler");
    pragma Weak_External (DMA1_Stream7_IRQHandler);
    pragma Linker_Alias (DMA1_Stream7_IRQHandler, "Default_Handler");

    procedure FSMC_IRQHandler;
    pragma Export(Ada, FSMC_IRQHandler, "FSMC_IRQHandler");
    pragma Weak_External (FSMC_IRQHandler);
    pragma Linker_Alias (FSMC_IRQHandler, "Default_Handler");

    procedure SDIO_IRQHandler;
    pragma Export(Ada, SDIO_IRQHandler, "SDIO_IRQHandler");
    pragma Weak_External (SDIO_IRQHandler);
    pragma Linker_Alias (SDIO_IRQHandler, "Default_Handler");

    procedure TIM5_IRQHandler;
    pragma Export(Ada, TIM5_IRQHandler, "TIM5_IRQHandler");
    pragma Weak_External (TIM5_IRQHandler);
    pragma Linker_Alias (TIM5_IRQHandler, "Default_Handler");

    procedure SPI3_IRQHandler;
    pragma Export(Ada, SPI3_IRQHandler, "SPI3_IRQHandler");
    pragma Weak_External (SPI3_IRQHandler);
    pragma Linker_Alias (SPI3_IRQHandler, "Default_Handler");

    procedure UART4_IRQHandler;
    pragma Export(Ada, UART4_IRQHandler, "UART4_IRQHandler");
    pragma Weak_External (UART4_IRQHandler);
    pragma Linker_Alias (UART4_IRQHandler, "Default_Handler");

    procedure UART5_IRQHandler;
    pragma Export(Ada, UART5_IRQHandler, "UART5_IRQHandler");
    pragma Weak_External (UART5_IRQHandler);
    pragma Linker_Alias (UART5_IRQHandler, "Default_Handler");

    procedure TIM6_DAC_IRQHandler;
    pragma Export(Ada, TIM6_DAC_IRQHandler, "TIM6_DAC_IRQHandler");
    pragma Weak_External (TIM6_DAC_IRQHandler);
    pragma Linker_Alias (TIM6_DAC_IRQHandler, "Default_Handler");

    procedure TIM7_IRQHandler;
    pragma Export(Ada, TIM7_IRQHandler, "TIM7_IRQHandler");
    pragma Weak_External (TIM7_IRQHandler);
    pragma Linker_Alias (TIM7_IRQHandler, "Default_Handler");

    procedure DMA2_Stream0_IRQHandler;
    pragma Export(Ada, DMA2_Stream0_IRQHandler, "DMA2_Stream0_IRQHandler");
    pragma Weak_External (DMA2_Stream0_IRQHandler);
    pragma Linker_Alias (DMA2_Stream0_IRQHandler, "Default_Handler");

    procedure DMA2_Stream1_IRQHandler;
    pragma Export(Ada, DMA2_Stream1_IRQHandler, "DMA2_Stream1_IRQHandler");
    pragma Weak_External (DMA2_Stream1_IRQHandler);
    pragma Linker_Alias (DMA2_Stream1_IRQHandler, "Default_Handler");

    procedure DMA2_Stream2_IRQHandler;
    pragma Export(Ada, DMA2_Stream2_IRQHandler, "DMA2_Stream2_IRQHandler");
    pragma Weak_External (DMA2_Stream2_IRQHandler);
    pragma Linker_Alias (DMA2_Stream2_IRQHandler, "Default_Handler");

    procedure DMA2_Stream3_IRQHandler;
    pragma Export(Ada, DMA2_Stream3_IRQHandler, "DMA2_Stream3_IRQHandler");
    pragma Weak_External (DMA2_Stream3_IRQHandler);
    pragma Linker_Alias (DMA2_Stream3_IRQHandler, "Default_Handler");

    procedure DMA2_Stream4_IRQHandler;
    pragma Export(Ada, DMA2_Stream4_IRQHandler, "DMA2_Stream4_IRQHandler");
    pragma Weak_External (DMA2_Stream4_IRQHandler);
    pragma Linker_Alias (DMA2_Stream4_IRQHandler, "Default_Handler");

    procedure ETH_IRQHandler;
    pragma Export(Ada, ETH_IRQHandler, "ETH_IRQHandler");
    pragma Weak_External (ETH_IRQHandler);
    pragma Linker_Alias (ETH_IRQHandler, "Default_Handler");

    procedure ETH_WKUP_IRQHandler;
    pragma Export(Ada, ETH_WKUP_IRQHandler, "ETH_WKUP_IRQHandler");
    pragma Weak_External (ETH_WKUP_IRQHandler);
    pragma Linker_Alias (ETH_WKUP_IRQHandler, "Default_Handler");

    procedure CAN2_TX_IRQHandler;
    pragma Export(Ada, CAN2_TX_IRQHandler, "CAN2_TX_IRQHandler");
    pragma Weak_External (CAN2_TX_IRQHandler);
    pragma Linker_Alias (CAN2_TX_IRQHandler, "Default_Handler");

    procedure CAN2_RX0_IRQHandler;
    pragma Export(Ada, CAN2_RX0_IRQHandler, "CAN2_RX0_IRQHandler");
    pragma Weak_External (CAN2_RX0_IRQHandler);
    pragma Linker_Alias (CAN2_RX0_IRQHandler, "Default_Handler");

    procedure CAN2_RX1_IRQHandler;
    pragma Export(Ada, CAN2_RX1_IRQHandler, "CAN2_RX1_IRQHandler");
    pragma Weak_External (CAN2_RX1_IRQHandler);
    pragma Linker_Alias (CAN2_RX1_IRQHandler, "Default_Handler");

    procedure CAN2_SCE_IRQHandler;
    pragma Export(Ada, CAN2_SCE_IRQHandler, "CAN2_SCE_IRQHandler");
    pragma Weak_External (CAN2_SCE_IRQHandler);
    pragma Linker_Alias (CAN2_SCE_IRQHandler, "Default_Handler");

    procedure OTG_FS_IRQHandler;
    pragma Export(Ada, OTG_FS_IRQHandler, "OTG_FS_IRQHandler");
    pragma Weak_External (OTG_FS_IRQHandler);
    pragma Linker_Alias (OTG_FS_IRQHandler, "Default_Handler");

    procedure DMA2_Stream5_IRQHandler;
    pragma Export(Ada, DMA2_Stream5_IRQHandler, "DMA2_Stream5_IRQHandler");
    pragma Weak_External (DMA2_Stream5_IRQHandler);
    pragma Linker_Alias (DMA2_Stream5_IRQHandler, "Default_Handler");

    procedure DMA2_Stream6_IRQHandler;
    pragma Export(Ada, DMA2_Stream6_IRQHandler, "DMA2_Stream6_IRQHandler");
    pragma Weak_External (DMA2_Stream6_IRQHandler);
    pragma Linker_Alias (DMA2_Stream6_IRQHandler, "Default_Handler");

    procedure DMA2_Stream7_IRQHandler;
    pragma Export(Ada, DMA2_Stream7_IRQHandler, "DMA2_Stream7_IRQHandler");
    pragma Weak_External (DMA2_Stream7_IRQHandler);
    pragma Linker_Alias (DMA2_Stream7_IRQHandler, "Default_Handler");

    procedure USART6_IRQHandler;
    pragma Export(Ada, USART6_IRQHandler, "USART6_IRQHandler");
    pragma Weak_External (USART6_IRQHandler);
    pragma Linker_Alias (USART6_IRQHandler, "Default_Handler");

    procedure I2C3_EV_IRQHandler;
    pragma Export(Ada, I2C3_EV_IRQHandler, "I2C3_EV_IRQHandler");
    pragma Weak_External (I2C3_EV_IRQHandler);
    pragma Linker_Alias (I2C3_EV_IRQHandler, "Default_Handler");

    procedure I2C3_ER_IRQHandler;
    pragma Export(Ada, I2C3_ER_IRQHandler, "I2C3_ER_IRQHandler");
    pragma Weak_External (I2C3_ER_IRQHandler);
    pragma Linker_Alias (I2C3_ER_IRQHandler, "Default_Handler");

    procedure OTG_HS_EP1_OUT_IRQHandler;
    pragma Export(Ada, OTG_HS_EP1_OUT_IRQHandler, "OTG_HS_EP1_OUT_IRQHandler");
    pragma Weak_External (OTG_HS_EP1_OUT_IRQHandler);
    pragma Linker_Alias (OTG_HS_EP1_OUT_IRQHandler, "Default_Handler");

    procedure OTG_HS_EP1_IN_IRQHandler;
    pragma Export(Ada, OTG_HS_EP1_IN_IRQHandler, "OTG_HS_EP1_IN_IRQHandler");
    pragma Weak_External (OTG_HS_EP1_IN_IRQHandler);
    pragma Linker_Alias (OTG_HS_EP1_IN_IRQHandler, "Default_Handler");

    procedure OTG_HS_WKUP_IRQHandler;
    pragma Export(Ada, OTG_HS_WKUP_IRQHandler, "OTG_HS_WKUP_IRQHandler");
    pragma Weak_External (OTG_HS_WKUP_IRQHandler);
    pragma Linker_Alias (OTG_HS_WKUP_IRQHandler, "Default_Handler");

    procedure OTG_HS_IRQHandler;
    pragma Export(Ada, OTG_HS_IRQHandler, "OTG_HS_IRQHandler");
    pragma Weak_External (OTG_HS_IRQHandler);
    pragma Linker_Alias (OTG_HS_IRQHandler, "Default_Handler");

    procedure DCMI_IRQHandler;
    pragma Export(Ada, DCMI_IRQHandler, "DCMI_IRQHandler");
    pragma Weak_External (DCMI_IRQHandler);
    pragma Linker_Alias (DCMI_IRQHandler, "Default_Handler");

    procedure CRYP_IRQHandler;
    pragma Export(Ada, CRYP_IRQHandler, "CRYP_IRQHandler");
    pragma Weak_External (CRYP_IRQHandler);
    pragma Linker_Alias (CRYP_IRQHandler, "Default_Handler");

    procedure HASH_RNG_IRQHandler;
    pragma Export(Ada, HASH_RNG_IRQHandler, "HASH_RNG_IRQHandler");
    pragma Weak_External (HASH_RNG_IRQHandler);
    pragma Linker_Alias (HASH_RNG_IRQHandler, "Default_Handler");

    procedure FPU_IRQHandler;
    pragma Export(Ada, FPU_IRQHandler, "FPU_IRQHandler");
    pragma Weak_External (FPU_IRQHandler);
    pragma Linker_Alias (FPU_IRQHandler, "Default_Handler");


    -- The vector table
    vector_table : Address_Array := (
        Stack_Start,
        Reset_Handler'Address,
        NMI_Handler'Address,
        HardFault_Handler'Address,
        MemManage_Handler'Address,
        BusFault_Handler'Address,
        UsageFault_Handler'Address,
        Reserved_Address,
        Reserved_Address,
        Reserved_Address,
        Reserved_Address,
        SVC_Handler'Address,
        DebugMon_Handler'Address,
        Reserved_Address,
        PendSV_Handler'Address,
        SysTick_Handler'Address,
        WWDG_IRQHandler'Address,
        PVD_IRQHandler'Address,
        TAMP_STAMP_IRQHandler'Address,
        RTC_WKUP_IRQHandler'Address,
        Reserved_Address,
        RCC_IRQHandler'Address,
        EXTI0_IRQHandler'Address,
        EXTI1_IRQHandler'Address,
        EXTI2_IRQHandler'Address,
        EXTI3_IRQHandler'Address,
        EXTI4_IRQHandler'Address,
        DMA1_Stream0_IRQHandler'Address,
        DMA1_Stream1_IRQHandler'Address,
        DMA1_Stream2_IRQHandler'Address,
        DMA1_Stream3_IRQHandler'Address,
        DMA1_Stream4_IRQHandler'Address,
        DMA1_Stream5_IRQHandler'Address,
        DMA1_Stream6_IRQHandler'Address,
        ADC_IRQHandler'Address,
        CAN1_TX_IRQHandler'Address,
        CAN1_RX0_IRQHandler'Address,
        CAN1_RX1_IRQHandler'Address,
        CAN1_SCE_IRQHandler'Address,
        EXTI9_5_IRQHandler'Address,
        TIM1_BRK_TIM9_IRQHandler'Address,
        TIM1_UP_TIM10_IRQHandler'Address,
        TIM1_TRG_COM_TIM11_IRQHandler'Address,
        TIM1_CC_IRQHandler'Address,
        TIM2_IRQHandler'Address,
        TIM3_IRQHandler'Address,
        TIM4_IRQHandler'Address,
        I2C1_EV_IRQHandler'Address,
        I2C1_ER_IRQHandler'Address,
        I2C2_EV_IRQHandler'Address,
        I2C2_ER_IRQHandler'Address,
        SPI1_IRQHandler'Address,
        SPI2_IRQHandler'Address,
        USART1_IRQHandler'Address,
        USART2_IRQHandler'Address,
        USART3_IRQHandler'Address,
        EXTI15_10_IRQHandler'Address,
        RTC_Alarm_IRQHandler'Address,
        OTG_FS_WKUP_IRQHandler'Address,
        TIM8_BRK_TIM12_IRQHandler'Address,
        TIM8_UP_TIM13_IRQHandler'Address,
        TIM8_TRG_COM_TIM14_IRQHandler'Address,
        TIM8_CC_IRQHandler'Address,
        DMA1_Stream7_IRQHandler'Address,
        FSMC_IRQHandler'Address,
        SDIO_IRQHandler'Address,
        TIM5_IRQHandler'Address,
        SPI3_IRQHandler'Address,
        UART4_IRQHandler'Address,
        UART5_IRQHandler'Address,
        TIM6_DAC_IRQHandler'Address,
        TIM7_IRQHandler'Address,
        DMA2_Stream0_IRQHandler'Address,
        DMA2_Stream1_IRQHandler'Address,
        DMA2_Stream2_IRQHandler'Address,
        DMA2_Stream3_IRQHandler'Address,
        DMA2_Stream4_IRQHandler'Address,
        ETH_IRQHandler'Address,
        ETH_WKUP_IRQHandler'Address,
        CAN2_TX_IRQHandler'Address,
        CAN2_RX0_IRQHandler'Address,
        CAN2_RX1_IRQHandler'Address,
        CAN2_SCE_IRQHandler'Address,
        OTG_FS_IRQHandler'Address,
        DMA2_Stream5_IRQHandler'Address,
        DMA2_Stream6_IRQHandler'Address,
        DMA2_Stream7_IRQHandler'Address,
        USART6_IRQHandler'Address,
        I2C3_EV_IRQHandler'Address,
        I2C3_ER_IRQHandler'Address,
        OTG_HS_EP1_OUT_IRQHandler'Address,
        OTG_HS_EP1_IN_IRQHandler'Address,
        OTG_HS_WKUP_IRQHandler'Address,
        OTG_HS_IRQHandler'Address,
        DCMI_IRQHandler'Address,
        CRYP_IRQHandler'Address,
        HASH_RNG_IRQHandler'Address,
        FPU_IRQHandler'Address
    );
    pragma Linker_Section (vector_table, ".isr_vector");

end startup;