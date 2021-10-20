library ieee;
use ieee.std_logic_1164.all;

entity example_and is
port(
    input_1    : in  std_logic;
    input_2    : in  std_logic;
    and_result : out std_logic
);

constant MAX_COUNT : integer := 2 ** 8 - 1;
end example_and;

architecture sim of example_and is
 
    signal CountUp   : integer := 0;
    signal CountDown : integer := 10;
 
begin
 
    process is
    begin
 
        CountUp   <= CountUp + 1;
        CountDown <= CountDown - 1;
        wait for 10 ns;
 
    end process;
 
    process is
    begin
 
        if MAX_COUNT > CountDown then
            report "CountUp is larger";
        elsif CountUp < MAX_COUNT then
            report "CountDown is larger";
        else
            report "They are equal";
        end if;
 
        wait on CountUp, CountDown;
 
    end process;
 
end sim;