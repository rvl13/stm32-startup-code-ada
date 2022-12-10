package body startup is

    procedure default_procedure is null;

    procedure last_chance_handler is null;
    
    procedure Reset_Handler is
        -- Start of .data section in RAM
        Sdata : Unsigned_8
            with Import, Convention => Asm, External_Name => "_sdata";
        -- End of .data section in RAM
        Edata : Unsigned_8
            with Import, Convention => Asm, External_Name => "_edata";
        -- Load Address of .data section in FLASH (ROM)
        Ldata : Unsigned_8
            with Import, Convention => Asm, External_Name => "_la_data";
        -- Start of .bss section in RAM
        Sbss : Unsigned_8
            with Import, Convention => Asm, External_Name => "_sbss";
        -- End of .bss section in RAM
        Ebss : Unsigned_8
            with Import, Convention => Asm, External_Name => "_ebss";
        -- Size of .data section
        Data_Size : constant Unsigned_32 := Addr_To_U32(Edata'Address) - Addr_To_U32(Sdata'Address);
        -- .data section in Flash
        --  Index from 1 so as to avoid subtracting 1 from the size
        Data_In_Flash : Section_Array (1 .. Data_Size)
            with Import, Convention => Asm, External_Name => "_la_data";
        -- .data section in RAM
        Data_In_Sram : Section_Array (1 .. Data_Size)
            with Import, Convention => Asm, External_Name => "_sdata";
        -- Size of .bss section
        Bss_Size : constant Unsigned_32 := Addr_To_U32(Ebss'Address) - Addr_To_U32(Sbss'Address);
        -- .bss section in RAM
        Bss_In_Sram : Section_Array (1 .. Bss_Size)
            with Import, Convention => Asm, External_Name => "_sbss";
    begin
        -- copy .data section from Flash (ROM) to RAM
        for J in Data_In_Sram'First .. Data_In_Sram'Last loop
            Data_In_Sram(J) := Data_In_Flash(J);
        end loop;

        -- initialize .bss section in RAM
        for J in Bss_In_Sram'First .. Bss_In_Sram'Last loop
            Bss_In_Sram(J) := 16#00#;
        end loop;

        -- call the main procedure
        main_app;

    end Reset_Handler;
    
    -- The null procedures,
    -- because being the weak symbol and aliased to default_procedure
    procedure NMI_Handler is null;
    procedure HardFault_Handler is null;
    procedure MemManage_Handler is null;
    procedure BusFault_Handler is null;
    procedure UsageFault_Handler is null;
    procedure SVC_Handler is null;
    procedure DebugMon_Handler is null;
    procedure PendSV_Handler is null;
    procedure SysTick_Handler is null;
    procedure WWDG_IRQHandler is null;
    procedure PVD_IRQHandler is null;
    procedure TAMP_STAMP_IRQHandler is null;
    procedure RTC_WKUP_IRQHandler is null;
    procedure RCC_IRQHandler is null;
    procedure EXTI0_IRQHandler is null;
    procedure EXTI1_IRQHandler is null;
    procedure EXTI2_IRQHandler is null;
    procedure EXTI3_IRQHandler is null;
    procedure EXTI4_IRQHandler is null;
    procedure DMA1_Stream0_IRQHandler is null;
    procedure DMA1_Stream1_IRQHandler is null;
    procedure DMA1_Stream2_IRQHandler is null;
    procedure DMA1_Stream3_IRQHandler is null;
    procedure DMA1_Stream4_IRQHandler is null;
    procedure DMA1_Stream5_IRQHandler is null;
    procedure DMA1_Stream6_IRQHandler is null;
    procedure ADC_IRQHandler is null;
    procedure CAN1_TX_IRQHandler is null;
    procedure CAN1_RX0_IRQHandler is null;
    procedure CAN1_RX1_IRQHandler is null;
    procedure CAN1_SCE_IRQHandler is null;
    procedure EXTI9_5_IRQHandler is null;
    procedure TIM1_BRK_TIM9_IRQHandler is null;
    procedure TIM1_UP_TIM10_IRQHandler is null;
    procedure TIM1_TRG_COM_TIM11_IRQHandler is null;
    procedure TIM1_CC_IRQHandler is null;
    procedure TIM2_IRQHandler is null;
    procedure TIM3_IRQHandler is null;
    procedure TIM4_IRQHandler is null;
    procedure I2C1_EV_IRQHandler is null;
    procedure I2C1_ER_IRQHandler is null;
    procedure I2C2_EV_IRQHandler is null;
    procedure I2C2_ER_IRQHandler is null;
    procedure SPI1_IRQHandler is null;
    procedure SPI2_IRQHandler is null;
    procedure USART1_IRQHandler is null;
    procedure USART2_IRQHandler is null;
    procedure USART3_IRQHandler is null;
    procedure EXTI15_10_IRQHandler is null;
    procedure RTC_Alarm_IRQHandler is null;
    procedure OTG_FS_WKUP_IRQHandler is null;
    procedure TIM8_BRK_TIM12_IRQHandler is null;
    procedure TIM8_UP_TIM13_IRQHandler is null;
    procedure TIM8_TRG_COM_TIM14_IRQHandler is null;
    procedure TIM8_CC_IRQHandler is null;
    procedure DMA1_Stream7_IRQHandler is null;
    procedure FSMC_IRQHandler is null;
    procedure SDIO_IRQHandler is null;
    procedure TIM5_IRQHandler is null;
    procedure SPI3_IRQHandler is null;
    procedure UART4_IRQHandler is null;
    procedure UART5_IRQHandler is null;
    procedure TIM6_DAC_IRQHandler is null;
    procedure TIM7_IRQHandler is null;
    procedure DMA2_Stream0_IRQHandler is null;
    procedure DMA2_Stream1_IRQHandler is null;
    procedure DMA2_Stream2_IRQHandler is null;
    procedure DMA2_Stream3_IRQHandler is null;
    procedure DMA2_Stream4_IRQHandler is null;
    procedure ETH_IRQHandler is null;
    procedure ETH_WKUP_IRQHandler is null;
    procedure CAN2_TX_IRQHandler is null;
    procedure CAN2_RX0_IRQHandler is null;
    procedure CAN2_RX1_IRQHandler is null;
    procedure CAN2_SCE_IRQHandler is null;
    procedure OTG_FS_IRQHandler is null;
    procedure DMA2_Stream5_IRQHandler is null;
    procedure DMA2_Stream6_IRQHandler is null;
    procedure DMA2_Stream7_IRQHandler is null;
    procedure USART6_IRQHandler is null;
    procedure I2C3_EV_IRQHandler is null;
    procedure I2C3_ER_IRQHandler is null;
    procedure OTG_HS_EP1_OUT_IRQHandler is null;
    procedure OTG_HS_EP1_IN_IRQHandler is null;
    procedure OTG_HS_WKUP_IRQHandler is null;
    procedure OTG_HS_IRQHandler is null;
    procedure DCMI_IRQHandler is null;
    procedure CRYP_IRQHandler is null;
    procedure HASH_RNG_IRQHandler is null;
    procedure FPU_IRQHandler is null;


end startup;