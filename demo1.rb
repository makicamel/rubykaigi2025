require "#{Dir.pwd}/lib/road_to_rubykaigi"

class NoisySquareSequencer < RoadToRubykaigi::Audio::SequencerBase
  GENERATOR = RoadToRubykaigi::Audio::RoundedSquareOscillator
  STACCATO_RATIO = 1.0
  SCORE = ([
    { frequency: %i[C4], duration: 1 },
    { frequency: %i[D4], duration: 1 },
    { frequency: %i[E4], duration: 1 },
    { frequency: %i[F4], duration: 1 },
    { frequency: %i[G4], duration: 1 },
    { frequency: %i[A4], duration: 1 },
    { frequency: %i[B4], duration: 1 },
    { frequency: %i[C5], duration: 1 },
  ])

  private

  def envelope
    1
  end

  def default_envelop_key
    :bass
  end

  def loop?
    false
  end
end

class ZeroSequencer < RoadToRubykaigi::Audio::SequencerBase
  GENERATOR = RoadToRubykaigi::Audio::RoundedSquareOscillator
  STACCATO_RATIO = 1.0
  SCORE = ([
    { frequency: %i[C4], duration: 10 },
  ])

  def gain
    0.0
  end

  private

  def default_envelop_key
    :bass
  end

  def loop?
    true
  end
end

zero_sequencer = ZeroSequencer.new
noisy_sequencer = NoisySquareSequencer.new
RoadToRubykaigi::Audio::AudioEngine.new(
  zero_sequencer, noisy_sequencer
)
sleep 5
