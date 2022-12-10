package body leds is

    procedure Init_Leds is
    begin
        -- Enable Clock for GPIOD
        RCC_AHB1_ENR := RCC_AHB1_ENR or 16#08#;
        -- Set Red LED to output
        GPIOD_MODER := GPIOD_MODER or Shift_Left(1, 2 * Red_Led);
        -- Off the LED
        Led_Off(Red_Led);
    end init_leds;



    procedure Led_On(This : Natural) is
    begin
        GPIOD_ODR := GPIOD_ODR or Shift_Left(1, This);
    end Led_On;



    procedure Led_Off(This : Natural) is
    begin
        GPIOD_ODR := GPIOD_ODR and ( not ( Shift_Left(1, This) ) );
    end Led_Off;



    procedure delay_sw(This : Natural) is
        Counter : Natural := 0;
    begin
        while (Counter < This) loop
            Counter := Counter + 1;
        end loop;
    end delay_sw;

end leds;