oof = "C:/Users/nicholas_wansley/Downloads/parameterized_stranger_things/zapsplat_cartoon_character_vocalisation_high_pitched_fight_grunt_004_32250.wav"



use_bpm 120

define :looper do |a, b, y, x|
  play a, amp: 1.4
  sleep y
  play b, amp: 1.4
  sleep x
end

define :notes do |a, b, c, d, e, f, g, h, y|
  play a
  sleep y
  play b
  sleep y
  play c
  sleep y
  play d
  sleep y
  play e
  sleep y
  play f
  sleep y
  play g
  sleep y
  play h
  sleep y
end
x = 0.5
define :a_notes do
  play :a5,amp: x
  play :a6,amp: x
  sleep 0.7
end
define :c_notes do
  play :c6,amp: x
  play :c7,amp: x
  sleep 0.7
end
define :g_notes do
  play :g5,amp: x
  play :g6,amp: x
  sleep 0.7
end
define :f_notes do
  play :f5,amp: x
  play :f6,amp: x
  sleep 0.7
end
define :d_notes do
  play :d6,amp: x
  play :d7,amp: x
  sleep 0.7
end
define :e_notes do
  play :e6,amp: x
  play :e7,amp: x
  sleep 0.7
end
define :b_notes do
  play :b5,amp: x
  play :b6,amp: x
  sleep 0.7
end
define :inoutro do
  a_notes
  x = x - 0.025
  a_notes
  c_notes
  x = x - 0.025
  a_notes
  d_notes
  x = x - 0.025
  a_notes
  e_notes
  x = x - 0.025
  d_notes
  
  2.times do
    c_notes
  end
  
  e_notes
  x = x - 0.025
  c_notes
  a_notes
  x = x - 0.064
  e_notes
  a_notes
  x = x - 0.025
  g_notes
  g_notes
  x = x - 0.025
  b_notes
  g_notes
  x = x - 0.025
  c_notes
  g_notes
  x = x - 0.05
  d_notes
  c_notes
  x = x - 0.025
  f_notes
  f_notes
  x = x - 0.05
  c_notes
  f_notes
  x = x - 0.03
  c_notes
  f_notes
  x = x - 0.03
  c_notes
  b_notes
  print x
end
#Intro
live_loop:intro do
  sample oof
  sleep 1.4
  2.times do
    use_synth  :prophet
    a_notes
    a_notes
    c_notes
    a_notes
    d_notes
    a_notes
    e_notes
    d_notes
    
    2.times do
      c_notes
    end
    
    e_notes
    c_notes
    a_notes
    e_notes
    a_notes
    g_notes
    g_notes
    b_notes
    g_notes
    c_notes
    g_notes
    d_notes
    c_notes
    f_notes
    f_notes
    c_notes
    f_notes
    c_notes
    f_notes
    c_notes
    b_notes
    print x
  end
  inoutro
  stop
end
q = 0
#q counter which all the code relies on
live_loop:q do
  if q < 36
    q = q + 1
    sleep 6
    print q
  else
    stop
  end
end
sleep 10.5
#Buzz Noise
live_loop:para do
  2.times do
    if q < 24
      use_synth :pulse
      notes :c1, :e1, :g1, :b1, :c2, :b1, :g1, :e1, 2.8
    else
      stop
    end
  end
  2.times do
    if q < 24
      use_synth  :dsaw
      notes :c1, :e1, :g1, :b1, :c2, :d2, :e2, :f2, 2.8
    else
      stop
    end
  end
end
sleep 14
#Faint Background Noise
live_loop:loop do
  if q < 24
    use_synth :dark_ambience
    use_synth_defaults sustain: 0.25
    looper :a5, :b6, 0.7, 1.4
  else
    stop
  end
end
#Looping bass noise
live_loop:bass do
  a = [:e3, :e3, :g3, :e3, 0, :d3, :c3, :b2]
  if x == 0.05099999999999984
    n = 0
    define :sus do
      play a[n], amp: 0.6
      sleep 0.7
      n = n + 1
    end
    define :suss do
      play a[n], amp: 0.6
      sleep 1.4
      n = n + 1
    end
    8.times do
      if q < 24
        use_synth :fm
        use_synth_defaults sustain: 0.25
        sus
        suss
        sus
        suss
        if n == 8
          n = 0
        end
      else
        stop
      end
    end
    n = 0
  end
  sleep 0.7
end

sleep 8.4
#Wave/Growling noises
live_loop:woah do
  u = 0
  t = 0
  if x == 0.05099999999999984
    sleep 9.1
    t = 1
    print t
  end
  12.times do
    if t == 1
      if u == 0
        use_synth :growl
        d = 2
      end
      if u == 4
        use_synth :bnoise
        d = 2
      end
      if u == 8
        use_synth :square
        d = 1
        
      end
      if q < 24
        play :g1, attack: 2, sustain: 0.4, relax_time: 2, release: d
        sleep 2.8
        u = u + 1
        print u
      else
        stop
      end
    end
  end
  sleep 0.7
end
#Random Function
live_loop:random do
  use_synth :fm
  if q > 22
    if q < 36
      play choose ([:e4, :e4, :g4, :e5, :d2, :d4, :c4, :b3])
      sleep choose([0.7, 1.4, 2.1])
    else
      stop
    end
  end
  sleep 0.7
end
#Outro
live_loop :outro do
  if q > 34
    if q < 40
      1.times do
        use_synth  :prophet
        a_notes
        x = x + 0.025
        a_notes
        c_notes
        x = x + 0.025
        a_notes
        d_notes
        x = x + 0.025
        a_notes
        e_notes
        x = x + 0.025
        d_notes
        
        2.times do
          c_notes
        end
        
        e
        x = x + 0.025
        c_notes
        a_notes
        x = x + 0.064
        e_notes
        a_notes
        x = x + 0.025
        g_notes
        g_notes
        x = x + 0.025
        b_notes
        g_notes
        x = x + 0.025
        c_notes
        g_notes
        x = x + 0.05
        d_notes
        c_notes
        x = x + 0.025
        f_notes
        f_notes
        x = x + 0.05
        c_notes
        f_notes
        x = x + 0.03
        c_notes
        f_notes
        x = x + 0.03
        c_notes
        b_notes
        print x
        inoutro
        sleep 3
        sample oof
          stop
      end
    else
      stop
    end
  end
  sleep 0.7
end