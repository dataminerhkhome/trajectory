import scipy.integrate
from math import *
class Curve:
    def __init__(self, u8):
        self.u8=u8
        
    def __intgrate_f(self,q):
        return log((1+sin(q))/cos(q))+sin(q)/cos(q)**2
    def __curve_s(self,u0,q0,q):
        return (u0*cos(q0)/self.u8)**2*(self.__intgrate_f(q0)-self.__intgrate_f(q))+1
    def dis_x(self,u0,q0,q1):
        fun=lambda q: -1.0/cos(q)**2*(u0*cos(q0))**2/9.8/self.__curve_s(u0,q0,q)
        return scipy.integrate.quad(fun,q0,q1)
    def dis_y(self,u0,q0,q1):
        fun=lambda q: -sin(q)/cos(q)**3*(u0*cos(q0))**2/9.8/self.__curve_s(u0,q0,q)
        return scipy.integrate.quad(fun,q0,q1)
    def vel_x(self,u0,q0,q1):
        ux=u0*cos(q0)*self._integrate_f(q1)**(-1/2)
        return ux

        
        
   
# U0=37.6
U8=6.7
curve=Curve(U8)     

for angle_i in range(10,60,10):
    Q0=radians(angle_i)
    
    for speed_i in range(20,60,10):
        height=curve.dis_y(speed_i,Q0,0)
#         stroke= Stroke.create(velocity:speed_i,angle: angle_i, height:y_top,rise_time:t_top)
        print("{0} for speed {1} with {2}".format(height,speed_i,angle_i))
        for c_q in range(angle_i-5,-70, -5):
            Qe=radians(c_q)
            disx=curve.dis_x(speed_i,Q0,Qe)
            disy=curve.dis_y(speed_i,Q0,Qe)
            print(disx)
            print(disy)
            
            # position=Position.create!(x_speed:vx,y_speed:vy,distance:x,height:y,flight_time:index,stroke:stroke)
            


# disx=curve.dis_x(U0,Q0,0)
# disy=curve.dis_y(U0,Q0,0)
# print(disx)
# print(disy)
# ig_v=lambda q: log((1+sin(q))/cos(q))+sin(q)/cos(q)**2
# s=lambda q: (U0*cos(Q0)/U8)**2*(ig_v(Q0)-ig_v(q))+1
# fx=lambda q: -1.0/cos(q)**2*(U0*cos(Q0))**2/g0/s(q)
# fy=lambda q: -sin(q)/cos(q)**3*(U0*cos(Q0))**2/g0/s(q)
# disx=scipy.integrate.quad(fx,Q0,0)
# disy=scipy.integrate.quad(fy,Q0,0)
# print(disx)
# print(disy)


            