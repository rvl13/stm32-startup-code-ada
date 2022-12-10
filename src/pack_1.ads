with System;
with Interfaces; use Interfaces;

package pack_1 is

    -- The obvious one for magic hex word : "I Code ADA" 
    Magic_word : Unsigned_32 := 16#1C0DEADA#;
    -- 470674138 in decimal

    Initialize_me : Unsigned_32;

    function get_100Pi return Integer;

end pack_1;