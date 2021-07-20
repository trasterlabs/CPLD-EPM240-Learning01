module MaiBlinki(input wire clk, output wire[3:1] led);

reg[23:0] cnt;

wire a_led_to_output;
reg output1;
reg output2;

assign led[3]=a_led_to_output;
assign led[2]=output1;
assign led[1]=output2;

TestBlinkLed01 myLed01( .clk (clk), .the_led(a_led_to_output) );

always @(posedge clk) begin 
   cnt<= cnt + 1'b1; 
   output1 <= cnt[23];
   output2 <= cnt[22];
end

endmodule

module TestBlinkLed01(input clk, output wire the_led);

reg[23:0] cnt;

reg myled;

assign the_led = myled;

always @(posedge clk) begin 
   cnt<= cnt + 1'b1; 
   myled<= cnt[23] & cnt[22];
end

endmodule
