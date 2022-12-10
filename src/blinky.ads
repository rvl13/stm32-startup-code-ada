with pack_1;        use pack_1;
with Interfaces;    use Interfaces;
with leds;          use leds;

package blinky is 

    -- export as "main_app"
    procedure blink
    with
        Export,
        Convention => Ada,
        External_Name => "main_app";

end blinky;