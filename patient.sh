clear
tput setaf 4; figlet "Hospital X"; tput sgr0
tput setaf 2; figlet "Patient Management System"; tput sgr0
echo "------------------------------------------------------"
echo "Welcome to the Hospital X Patient Management System"
while true;
do
echo "------------------------------------------------------"


    echo "Please select an option from the menu below:"
    echo ""
    echo "[L/l] List patients"
    echo "[A/a] Add a new patient"
    echo "[S/s] Search patient"
    echo "[D/d] Delete patient"
    echo "[E/e] Exit"
    echo ""

    read -p "Enter your choice: " choice
    echo ""

    case "$choice" in
        [Ll]*)
            # List patients
            echo "You selected List patients."
            # Convert patient records to uppercase and sort them by first name, last name, phone number, and patient ID
            awk '{print toupper($0)}' patient.csv | sort -t, -k2,2 -k3,3 -k4,4 -k1,1 | awk -F, '{printf "%s\t%s\t%s\t%s\n", $3, $2, $4, $1}'
            read -p "Press Enter to continue..."
            ;;
        [Aa])
function generate_patient_id() {
    last_name=$(echo $2 | cut -c1-4 | tr '[:lower:]' '[:upper:]')
    first_name=$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')
    id=$last_name$first_name
    counter=2
    while grep -q "^$id" patient.csv; do
        id="${last_name}${first_name}${counter}"
        counter=$((counter+1))
    done
    echo $id
}

# Define function to add a new patient
function add_patient() {
    # Prompt the user for patient details
    read -p "Enter first name: " first_name
    read -p "Enter last name: " last_name
    read -p "Enter phone number: " phone_number

    # Generate the patient ID
    id=$(generate_patient_id "$first_name" "$last_name")

    # Add the patient record to the CSV file
    echo "$id,$first_name,$last_name,$phone_number" >> patient.csv

    echo "The new Patient ID is $id"
    echo "The new patient is added to the patient records."
}
            add_patient
            ;;
        [Ss])


# Prompt the user to enter the last name for the search
    echo "Enter the last name to search: "
    read lastname

# Convert the entered last name to lowercase for case-insensitive search
    searchname=$(echo "$lastname" | tr '[:upper:]' '[:lower:]')

# Perform the search and display matching records
    grep -i "$searchname" patient.csv | awk -F',' '{ print $1 "\t" $2 "\t" $3 "\t" $4 }'

            ;;
        [Dd])
delete_patient() {
    read -p "Enter patient's last name or part of it to delete: " last_name
    # use grep to find matching lines in patient.csv file
    matching_records=$(grep -i "$last_name" patient.csv)
    if [[ -z $matching_records ]]; then
        echo "No matching records found."
    else
        echo "The following records will be deleted:"
        echo "$matching_records"
        # use sed to delete matching lines from patient.csv file
        sed -i "/$last_name/Id" patient.csv
        echo "Records deleted successfully."
    fi
}
            delete_patient;;
        [Ee])
            # Exit
            echo "Thank You! Exiting program..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;


    esac

done









