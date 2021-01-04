----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.12.2020 15:26:38
-- Design Name: 
-- Module Name: Traffic_Light - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Traffic_Light is
Port (
rst : in std_logic;
clck : in std_logic;
r,g,y : out std_logic
 );
end Traffic_Light;

architecture Behavioral of Traffic_Light is
type state_type is (init,red,green,yellow);
signal state : state_type;
signal count : integer range 0 to 6 := 0;
begin
process(clck) -- process is sensitive to clock
begin
if(rising_edge(clck)) then
if(rst = '1') then
   state <= init;
   r <= '0';
   g <= '0';
   y <= '0';
else 
case(state) is
when init =>
   state <= red;
   count <= 0;
when red =>
  r <= '1';
  g <= '0';
  y <= '0';
  if(count <= 5) then
   state <= red;
   count <= count + 1;
  else
    state <= yellow;
    count <= 0;
  end if; 
when yellow =>
  r <= '0';
  y <= '1';
  g <= '0';
  if(count <= 5) then
   state <= yellow;
   count <= count + 1;
  else
    state <= green;
    count <= 0;
  end if; 
when green =>
  r <= '0';
  y <= '0';
  g <= '1';
  if(count <= 5) then
   state <= green;
   count <= count + 1;
  else
    state <= init;
    count <= 0;
  end if; 
when others =>
     state <= red;
end case;
end if;
end if;
end process;

end Behavioral;
