module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    parameter A=0,B=1,C=2,D=3;
    reg[1:0] state,next_state;

    // State transition logic
    always@(*)
        case(state)
            A:next_state<=(in==1)?B:A;
            B:next_state<=(in==1)?B:C;
            C:next_state<=(in==1)?D:A;
            D:next_state<=(in==1)?B:C;
        endcase

    // State flip-flops with synchronous reset
    always@(posedge clk)
        begin
            if(reset)
            	state<=A;
            else
                state<=next_state;
        end
                
    

    // Output logic
    assign out=(state==D)?1:0;

endmodule
