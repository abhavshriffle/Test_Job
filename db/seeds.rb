# Seed Lines
line1 = Line.find_or_create_by(name: 'LineA')
line2 = Line.find_or_create_by(name: 'LineB')
line3 = Line.find_or_create_by(name: 'LineC')
line4 = Line.find_or_create_by(name: 'LineD')

# Seed Train Operators
train_operator1 = TrainOperator.find_or_create_by(name: 'Operator1')
train_operator2 = TrainOperator.find_or_create_by(name: 'Operator2')

# Seed Parcel Owners
parcel_owner1 = ParcelOwner.find_or_create_by(name: 'Owner1')
parcel_owner2 = ParcelOwner.find_or_create_by(name: 'Owner2')

# Seed Trains
train1 = Train.find_or_create_by(train_operator_id: train_operator1.id, line: line1, capacity: 500, cost: 200, status: true, line_name: line1.name, time: "7:00")
train2 = Train.find_or_create_by(train_operator_id: train_operator2.id, line: line2, capacity: 150, cost: 150, status: true, line_name: line2.name, time: "8:00")
train3 = Train.find_or_create_by(train_operator_id: train_operator1.id, line: line3, capacity: 300, cost: 300, status: true, line_name: line3.name, time: "9:00")
train4 = Train.find_or_create_by(train_operator_id: train_operator2.id, line: line3, capacity: 100, cost: 250, status: true, line_name: line1.name, time: "10:00")
train5 = Train.find_or_create_by(train_operator_id: train_operator2.id, line: line2, capacity: 150, cost: 300, status: true, line_name: line2.name, time: "11:00")


# Seed Parcels
parcel1 = Parcel.find_or_create_by(parcel_owner_id: parcel_owner1.id, weight: 1, volume: 20)
parcel2 = Parcel.find_or_create_by(parcel_owner_id: parcel_owner2.id, weight: 0.5, volume: 5)

#Seed bookings
booking1 = Booking.find_or_create_by(train: train1, is_withdraw: false, parcel_id: parcel1, parcel_owner_id: parcel_owner1, line_name: train1.line_name)
booking2 = Booking.find_or_create_by(train: train2, is_withdraw: false, parcel_id: parcel2, parcel_owner_id: parcel_owner2, line_name: train2.line_name)
booking3 = Booking.find_or_create_by(train: train3, is_withdraw: false, parcel_id: parcel1, parcel_owner_id: parcel_owner1, line_name: train3.line_name)
booking4 = Booking.find_or_create_by(train: train4, is_withdraw: false, parcel_id: parcel2, parcel_owner_id: parcel_owner2, line_name: train4.line_name)

#Seed offers
offer1 = Offer.find_or_create_by(train_operator: train_operator1, price: 200, line: line1)
offer2 = Offer.find_or_create_by(train_operator: train_operator2, price: 150, line: line2)
offer3 = Offer.find_or_create_by(train_operator: train_operator1, price: 300, line: line3)
offer4 = Offer.find_or_create_by(train_operator: train_operator2, price: 250, line: line3)


puts 'Seed data created successfully.'
