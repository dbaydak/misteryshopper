# Automated User Journey Test Suite

This project is an automated test suite designed to simulate user journeys on a website, focusing on e-commerce flows and tracking key interactions. It uses Selenium WebDriver to control a web browser and perform actions like clicking, typing, and navigating through pages. The suite captures various details during the test, including cookies, page URLs, and order IDs, and saves the results in JSON format.

## Features

* Simulates user journeys based on YAML-defined test cases.
* Captures cookies, URLs, and order IDs.
* Saves test results in JSON format.
* Includes logging for debugging and analysis.
* Designed for containerized execution with Docker.

## Requirements

* Python 3.9
* Selenium
* Requests
* PyYAML
* undetected-chromedriver
* selenium-wire
* blinker

## Usage

1.  **Install dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

2.  **Define test cases:**

    Create YAML files in the `campaigns` directory to define user journey test cases. Each YAML file should contain a list of steps, where each step specifies an action (e.g., "goto", "click", "type"). See the existing YAML files in the `campaigns` directory for examples.

3.  **Run the tests:**

    ```bash
    python main.py
    ```

    This will run the tests using Chrome in headless mode. Test results will be saved in the `reports` directory.

## Docker Support

The project includes a Dockerfile for containerized execution. To build and run the tests in a Docker container:

1.  **Build the image:**

    ```bash
    docker build -t user-journey-tests.
    ```

2.  **Run the container:**

    ```bash
    docker run user-journey-tests
    ```

    This will run the tests inside the container and save the results in the `reports` directory within the container.

## Notes

*   The `reports` directory is excluded from the Docker build context to avoid unnecessary data being copied into the image. If you need to access the reports generated inside the container, you can either modify the Dockerfile to create the `reports` directory during the build process or adjust the `.dockerignore` file.
*   The test suite is designed to run in headless mode, meaning the browser will not be visible during the tests. If you need to see the browser interactions for debugging purposes, you can remove the `--headless` argument from the `browser_setup` function in `main.py`.
*   The test suite is currently configured to use Chrome. You can modify the `browser_setup` function in `main.py` to use a different browser (e.g., Firefox or Safari) if needed.

## Future Improvements

*   Add support for more browsers.
*   Implement more advanced test actions (e.g., JavaScript execution, file uploads).
*   Integrate with a test reporting tool.
*   Add support for parallel test execution.
*   Explore using a cloud-based Selenium Grid for distributed testing.


**Explanation:**

* **YAML files:** Define campaigns and user journeys. ->
* **main.py:** Orchestrates the testing process. ->
* **Web Driver Setup:** Initializes the browser. ->
* **Campaign Loading:** Reads campaign data. ->
* **User Journey Iteration:** Loops through user journeys. ->
* **Purchase Simulation:** Simulates user actions. ->
* **Results Saving:** Stores results in JSON format.
