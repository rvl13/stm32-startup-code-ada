with System;
with Interfaces; use Interfaces;

package leds is

    Red_Led : constant Natural := 10#14#;   -- PD14
    --Blue_Led : constant Natural := 10#15#;   -- PD15

    RCC_AHB1_ENR : Unsigned_32 with
        Volatile,
        Address => System'To_Address (16#40023830#);

    GPIOD_MODER : Unsigned_32 with
        Volatile,
        Address => System'To_Address (16#40020C00#);

    GPIOD_ODR : Unsigned_32 with
        Volatile,
        Address => System'To_Address (16#40020C14#);

    procedure Init_Leds;

    procedure Led_On(This : Natural);

    procedure Led_Off(This : Natural);

    procedure delay_sw(This : Natural);


end leds;