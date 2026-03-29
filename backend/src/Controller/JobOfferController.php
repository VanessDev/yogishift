<?php

namespace App\Controller;

use App\Repository\JobOfferRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Attribute\Route;

class JobOfferController extends AbstractController
{
    #[Route('/api/jobs', name: 'api_jobs')]
    public function getJobs(JobOfferRepository $jobOfferRepository): JsonResponse
    {
        $jobs = $jobOfferRepository->findAll();

        return $this->json($jobs);
    }
}