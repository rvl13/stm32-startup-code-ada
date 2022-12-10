package body handlers is

    procedure NMI_Handler is
        temp : Integer;
    begin
        temp := 10;
    end NMI_Handler;


    procedure HardFault_Handler is
        temp : Integer;
    begin
        temp := 11;
    end HardFault_Handler;


    procedure BusFault_Handler is
        temp : Integer;
    begin
        temp := 12;
    end BusFault_Handler;


    procedure UsageFault_Handler is
        temp : Integer;
    begin
        temp := 13;
    end UsageFault_Handler;


    procedure MemManage_Handler is
        temp : Integer;
    begin
        temp := 14;
    end MemManage_Handler;

end handlers;