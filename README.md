# Docker-Expo
An example of a dockerized React Native application with Expo

## How to run

1. Clone the repository
```bash
git clone git@github.com:PierreDubosq/Docker-Expo.git
```

2. Create a `.env` file at the root of the project with the following content (example in `.env.example`)
```bash
REACT_NATIVE_PACKAGER_HOSTNAME=
```

You can get the `REACT_NATIVE_PACKAGER_HOSTNAME` by running the following command
```bash
hostname -I
```

### With Docker image

3. Build the Docker image
```bash
docker build -t expo .
```

4. Run the Docker container
```bash
docker run -it -p 8081:8081 -env-file .env -v $(pwd):/app expo
```

### With Docker Compose

3. Run the Docker container with Docker Compose
```bash
docker-compose up
```

## How to access the Expo application

You can access the Expo application using the `REACT_NATIVE_PACKAGER_HOSTNAME`.

1. Open the Expo application on your phone

2. Scan the QR code displayed in the terminal, or enter the URL manually as `exp://<REACT_NATIVE_PACKAGER_HOSTNAME>:8081`

## How to develop

You can develop your React Native application as usual, the changes will be automatically reloaded in the Expo application.

## How to build

You can build the application using the following command
```bash
expo build:android
```

## Contributing

If you want to contribute to this project and make it better, your help is very welcome.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.