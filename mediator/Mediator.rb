class Mediator
  # клас Mediator, який є "посредником" для об'єктів Aircraft

  def initialize
    @aircrafts = []
  end
  # для того, щоб створювати нові об'єкти Aircraft

  def register_aircraft(aircraft)
    @aircrafts << aircraft
    aircraft.control_center = self
  end

  # метод, визначенний в класі Mediator, який приймає об'єкт Aircraft
  # в якості аргумента та додає його в список зареєстрованих літаків в центрі управління

  def request_permission_to_land(aircraft)
    puts "Traffic control center grants permission to land for #{aircraft.callsign}"
  end
  # метод відповідає за надання дозволу пов. судну на посадку після перевірки, чи отримав літак дозвіл на посадку чи ні
end

class Aircraft
  attr_accessor :callsign, :control_center

  def initialize(callsign)
    @callsign = callsign
  end
  # метод викликається, коли створюється новий об’єкт Aircraft,
  # і він встановлює для атрибута callsign об’єкта Aircraft значення,
  # передане як аргумент під час створення екземпляра об’єкта.

  def request_permission_to_land
    @control_center.request_permission_to_land(self)
  end
  # метод використовується для запиту дозволу на посадку від об’єкта Mediator,
  # який діє як посередник між різними літальними апаратами.
end

# приклад використання
control_center = Mediator.new

aircraft1 = Aircraft.new('BA123')
aircraft2 = Aircraft.new('UA456')
aircraft3 = Aircraft.new('AF789')

control_center.register_aircraft(aircraft1)
control_center.register_aircraft(aircraft2)
control_center.register_aircraft(aircraft3)

aircraft1.request_permission_to_land
aircraft2.request_permission_to_land
aircraft3.request_permission_to_land
