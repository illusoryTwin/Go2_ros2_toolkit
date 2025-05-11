import rclpy
from rosbag2_py import SequentialReader, StorageOptions, PlayOptions, ConverterOptions
from rclpy.serialization import deserialize_message
from builtin_interfaces.msg import Time
from sensor_msgs.msg import JointState, Imu
import matplotlib.pyplot as plt

def read_bagfile(bag_path):
    rclpy.init()

    storage_options = StorageOptions(uri=bag_path, storage_id='sqlite3')
    #play_options = PlayOptions()

    converter_options = ConverterOptions(
        input_serialization_format='cdr',
        output_serialization_format='cdr'
    )

    reader = SequentialReader()
    reader.open(storage_options, converter_options)

    joint_positions = []
    imu_linear = {'x': [], 'y': [], 'z': []}
    imu_angular = {'x': [], 'y': [], 'z': []}

    while reader.has_next():
        topic, data, t = reader.read_next()

        if topic == "/dynamic_joint_states":
            msg = deserialize_message(data, JointState)
            if msg.position:
                joint_positions.append(msg.position)

        elif topic == "/imu_sensor_broadcaster/imu":
            msg = deserialize_message(data, Imu)
            imu_linear['x'].append(msg.linear_acceleration.x)
            imu_linear['y'].append(msg.linear_acceleration.y)
            imu_linear['z'].append(msg.linear_acceleration.z)
            imu_angular['x'].append(msg.angular_velocity.x)
            imu_angular['y'].append(msg.angular_velocity.y)
            imu_angular['z'].append(msg.angular_velocity.z)

    rclpy.shutdown()
    return joint_positions, imu_linear, imu_angular

def plot_joint_positions(joint_positions):
    if not joint_positions:
        print("No joint state data found.")
        return

    for joint_index in range(len(joint_positions[0])):
        data = [positions[joint_index] for positions in joint_positions]
        plt.plot(data, label=f"Joint {joint_index}")

    plt.title("Joint Positions Over Time")
    plt.xlabel("Sample Index")
    plt.ylabel("Joint Position (rad)")
    plt.legend()
    plt.grid(True)
    plt.show()

def plot_imu_data(imu_data, title, ylabel):
    if not imu_data['x']:
        print(f"No IMU data found for {title}.")
        return

    plt.plot(imu_data['x'], label=f"{ylabel} X")
    plt.plot(imu_data['y'], label=f"{ylabel} Y")
    plt.plot(imu_data['z'], label=f"{ylabel} Z")

    plt.title(f"IMU {title} Over Time")
    plt.xlabel("Sample Index")
    plt.ylabel(ylabel)
    plt.legend()
    plt.grid(True)
    plt.show()

if __name__ == "__main__":
    bag_path = "/home/ekaterina/Workspace/data/bagfile"  # folder containing bagfile_0.db3

    joint_data, imu_acc, imu_vel = read_bagfile(bag_path)
    plot_joint_positions(joint_data)
    plot_imu_data(imu_acc, "Linear Acceleration", "m/s²")
    plot_imu_data(imu_vel, "Angular Velocity", "rad/s")

