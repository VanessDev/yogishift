<?php

namespace App\Entity;

use App\Repository\JobOfferRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: JobOfferRepository::class)]
#[ORM\Table(name: 'job_offers')]
class JobOffer
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(name: 'id_job_offer')]
    private ?int $id = null;

    #[ORM\Column(name: 'studio_id')]
    private ?int $studio_id = null;

    #[ORM\Column(name: 'title', length: 255, nullable: true)]
    private ?string $title = null;

    #[ORM\Column(name: 'description', type: 'text', nullable: true)]
    private ?string $description = null;

    #[ORM\Column(name: 'contractType', length: 100, nullable: true)]
    private ?string $contractType = null;

    #[ORM\Column(name: 'location', length: 255, nullable: true)]
    private ?string $location = null;

    #[ORM\Column(name: 'salaryMin', type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $salaryMin = null;

    #[ORM\Column(name: 'salaryMax', type: 'decimal', precision: 10, scale: 2, nullable: true)]
    private ?string $salaryMax = null;

    #[ORM\Column(name: 'startDate', type: 'date', nullable: true)]
    private ?\DateTimeInterface $startDate = null;

    #[ORM\Column(name: 'endDate', type: 'date', nullable: true)]
    private ?\DateTimeInterface $endDate = null;

    #[ORM\Column(name: 'createdAt', type: 'datetime', nullable: true)]
    private ?\DateTimeInterface $createdAt = null;

    #[ORM\Column(name: 'updatedAt', type: 'datetime', nullable: true)]
    private ?\DateTimeInterface $updatedAt = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getStudioId(): ?int
    {
        return $this->studio_id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function getContractType(): ?string
    {
        return $this->contractType;
    }

    public function getLocation(): ?string
    {
        return $this->location;
    }

    public function getSalaryMin(): ?string
    {
        return $this->salaryMin;
    }

    public function getSalaryMax(): ?string
    {
        return $this->salaryMax;
    }

    public function getStartDate(): ?\DateTimeInterface
    {
        return $this->startDate;
    }

    public function getEndDate(): ?\DateTimeInterface
    {
        return $this->endDate;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }
}