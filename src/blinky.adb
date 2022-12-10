package body blinky is


    procedure blink is
        v1 : Integer;
        v2 : Unsigned_32;
    begin

        -- First Initialze the LED
        Init_Leds;

        -- Then test modifying/accessing local and global variables 
        v1 := get_100Pi;
        v1 := v1 * 2;
        v2 := Magic_word;
        Initialize_me := 16#C0FFEE13#;

        -- and an infinite blinky :)
        loop
            Led_On(Red_Led); 
            delay_sw(400000);

            Led_Off(Red_Led);
            delay_sw(400000);
        end loop;

    end blink;

end blinky;